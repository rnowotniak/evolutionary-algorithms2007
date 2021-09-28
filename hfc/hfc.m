%
% Hierarchical Fair Competition
%
% Copyright (C) 2007   Robert Nowotniak
% Copyright (C) 2007   Michal Grebowiec
%

if false

    fitness = '- (100*(y-x.^2).^2+(1-x).^2)';
    xmin = -2;
    xmax = 2;
    ymin = -2;
    ymax = 2;
    poplen = 10; % subpopulation size

    % hfc parameters
    levels = 4;
    ExchGen = 5;
    CalibGen = 7;
    HFC_Iterations = 10;

    Pc = 0.95;
    Pm = 0.08;

    precision = 6;
    coding = 'gray';
    selection = 'roulette';

end

locus2 = ceil(log((xmax-xmin) * 10^precision +1)/log(2));
chromlen = locus2 + ceil(log((ymax-ymin) * 10^precision +1)/log(2));

% initial random populations
populations = [];
for n = 1:poplen * levels
    for locus = 1:chromlen
        if rand > 0.5
            chrom(locus) = '0';
        else
            chrom(locus) = '1';
        end
    end
    populations = strvcat(populations, chrom);
end

% indices of each subpopulation in global table
subpops = [];
for n = 0:levels
    subpops(n + 1) = 1 + n * poplen;
end


%
% Perform Calibration Stage
%
globalmax = [];
%worstval = [];
bestisland = [];
avgs = [];
iterations = CalibGen;
for lev = 1:levels
    population = populations(subpops(lev):subpops(lev+1) - 1,:);
    sga;
    populations(subpops(lev):subpops(lev+1) - 1,:) = population;
    % average fitness on this island
    avgs = [avgs sum(fvalues)/length(fvalues)];
    % for admission treshold distribution
    if length(globalmax) == 0 || bestval > globalmax
        globalmax = bestval;
        bestisland = lev;
    end
end

globalmax;
bestisland;

% admission tresholds (treshold for the first level doesn't matter)
worstval = min(avgs); %ranks(length(ranks), 2);
athreshs = [0];
for n = 1:levels-1
    athreshs = [athreshs worstval + (globalmax-worstval)/levels * n];
end


% make a hierarchy - sort islands according to their average
% fitness values (descending)
iranks = sortrows([(1:length(avgs))' avgs'], [-2]);
newpops = [];
for n = length(iranks):-1:1
    newpops = strvcat(newpops, populations((1 + (iranks(n,1)-1)*poplen):(iranks(n,1)*poplen), :));
end
populations = newpops;
clear newpops avgs iranks;
% End Of Calibration Stage

BESTARG = NaN;
BESTVAL = NaN;
BESTHIST = [];

for HFC_Iter = 1:HFC_Iterations
    disp(strcat('HFC Iteration: ', num2str(HFC_Iter)));

    % perform SGA, ExchGen times on each island
    for lev = 1:levels
        population = populations(subpops(lev):subpops(lev+1) - 1,:);
        iterations = ExchGen;
        sga;
        populations(subpops(lev):subpops(lev+1) - 1,:) = population;
    end

    % create ranking of all individuals (for migration purpose)
    %   ranks = (index in global population, fitness, island number)
    [x,y] = phenotype(populations, xmin, xmax, ymin, ymax, coding, locus2);
    fvalues = eval(fitness);
    ii = []; % island indexes column
    for n = 1:levels
        ii = [ii n*ones(1,poplen)];
    end
    ii = ii';
    ranks = [[[1:poplen*levels]' fvalues] ii];
    ranks = sortrows(ranks, [-2]);
    %ranks

    % indices of moved individuals
    deleted = [];
    newpops = [];
    for lev = levels:-1:2
        % create a group of competiting indivduals
        comp = [];
        % add all individuals already in this level
        comp = strvcat(comp, populations(1+(lev-1) * poplen:lev*poplen,:));
        %
        % add all individuals with acceptable fitness from lower levels
        %
        for n = 1:length(ranks) % traverse ranking downward
            if ranks(n,2) >= athreshs(lev) % fitness above acceptance threshold
                if lev == levels || ranks(n,2) < athreshs(lev+1)
                    % it's the highest level or fitness is not above upper
                    % level acceptance threshold
                    if ranks(n,3) < lev
                        % individual from lower level
                        comp = strvcat(comp, populations(ranks(n,1),:));
                        if ranks(n,3) == 1
                            % mark individual from base level as moved
                            deleted = [deleted ranks(n,1)];
                        end
                    end
                end
            else % start of worse individuals in ranking
                break
            end
        end
        % compute fitness values in the competiting group
        [x,y] = phenotype(comp, xmin, xmax, ymin, ymax, coding, locus2);
        fvalues = eval(fitness);
        % select a new population on island
        island = selectionFunc(comp, selection, fvalues, poplen);
        newpops = strvcat(island, newpops);
    end

    % create a brand new, random individuals in base level,
    % in place of individuals promoted to higher levels
    for i = deleted
        % random chromosom
        for locus = 1:chromlen
            if rand > 0.5
                chrom(locus) = '0';
            else
                chrom(locus) = '1';
            end
        end
        populations(i, :) = chrom;
    end
    newpops = strvcat(populations(1:poplen, :), newpops);
    populations = newpops;
    
    % Draw figure
    cla;
    hold on;
    domain = xmin:(xmax-xmin)/100:xmax;
    codomain = ymin:(ymax-ymin)/100:ymax;
    [x,y]=meshgrid(domain, codomain);
    z=eval(fitness);
    [contour1,h]=contour(x,y,z,20);

    [x,y] = phenotype(populations, xmin, xmax, ymin, ymax, coding, locus2);
    plot(x, y, 'o');
    drawnow;
    
    % Save best solution
    fvalues = eval(fitness);
    if isnan(BESTVAL) || max(fvalues) > BESTVAL
        BESTVAL = max(fvalues);
        BESTARG = [x(find(fvalues == BESTVAL, 1)) y(find(fvalues == BESTVAL, 1))];
    end
    BESTHIST = [BESTHIST max(fvalues)];
   
end % HFC Iterations loop

disp('best solution found:');
disp(BESTARG);
disp('value:');
disp(BESTVAL);

figure();
hold on;
plot(1:length(BESTHIST), BESTHIST, 'ro-');
legend('Best solution');
