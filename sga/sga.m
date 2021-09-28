%
% Simple Genetic Algorithm
%
% Copyright (C) 2007   Robert Nowotniak
% Copyright (C) 2007   Michal Grebowiec
%

%clear all

if false

    % xmin = 0;
    % xmax = 5;
    % fitness = '-((x-4).^2 + (x-4) - 3)';
    % poplen = 20;

    % fitness = 'humps(x)';
    % xmin = -2;
    % xmax = 2;
    % poplen = 50;

    fitness = 'sin(x).*x.^3.*cos(x).^2./x';
    xmin = 6;
    xmax = 17;
    poplen = 30;

    Pc = 0.95;
    Pm = 0.08;

    iterations = 20;
    precision = 5;
end


chromlen = ceil(log((xmax-xmin) * 10^precision +1)/log(2));

population = [];


clear MOVIE;

% initial random population
for n = 1:poplen
    for locus = 1:chromlen
        if rand > 0.5
            chrom(locus) = '0';
        else
            chrom(locus) = '1';
        end
    end
    population = strvcat(population, chrom);
end

disp('Population:');
showPop(population, xmin, xmax, coding);

bestx = [];
besty = [];
avgy = [];
worsty = [];

% number of epoch with no improvements
noimprov = 0;

for epoch = 1:iterations
    cla;
    fplot(fitness, [xmin xmax]);
    hold on;
    
    if epoch == 1
        % compute fitness function values
        fvalues = [];
        x = phenotype(population, xmin, xmax, coding);
        fvalues = eval(fitness);
    elseif noimprov == 5
        disp('Stagnation!');
        break
    end
    
    if length(besty) == 0 || max(fvalues) > max(besty)
        noimprov = 0;
    else
        noimprov = noimprov + 1;
    end
    
    % best solution in current population
    bestx = [bestx x(find(fvalues==max(fvalues), 1))];
    besty = [besty max(fvalues)];
    avgy  = [avgy sum(fvalues)/length(fvalues)];
    worsty = [worsty min(fvalues)];

    disp(fvalues);
    

    if strcmp(selection, 'tournament')
        % tournament selection
        newpopqty = 0;
        newpop = [];
        while newpopqty < poplen
            c1 = ceil(rand * poplen);
            c2 = ceil(rand * poplen);
            while c2 == c1
                c2 = ceil(rand * poplen);
            end
            c3 = ceil(rand * poplen);
            while c3 == c2
                c3 = ceil(rand * poplen);
            end
            if fvalues(c1) > max([fvalues(c2) fvalues(c3)])
                winner = c1;
            elseif fvalues(c2) > max([fvalues(c3) fvalues(c1)])
                winner = c2;
            else
                winner = c3;
            end
            newpop = strvcat(newpop, population(winner,:));
            newpopqty = newpopqty + 1;
        end
        % end of tournament
    elseif strcmp(selection, 'ranking')
        % ranking selection
        %     ranking = [];
        %     ranking(:,1) = [1:1:poplen]';
        %     ranking(:,2) = fvalues;
        %     ranking = sortrows(ranking, [-2]);
        %  (dopisac f-cje p-stwa)
        % end of ranking selection
    % elseif strcmp(selection, 'kolejna_metoda_selekcji')
    else
        % prepare for roulette selection
        % transform fitnes values to non-negative numbers
        sects = fvalues;
        if min(sects) < 0
            sects = sects - min(sects);
        end
        disp(sects);

        % compute roulette sections for each chromosome
        sects = sects / sum(sects);

        disp(sects);

        % transform sections to accumulated values
        for n = 2:length(sects)
            sects(n) = sects(n - 1) + sects(n);
        end

        disp(sects);

        % selection - prepare new population
        newpop = [];
        for n = 1:poplen
            r = rand;
            for i = 1:length(sects)
                if r <= sects(i)
                    newpop = strvcat(newpop, population(i,:));
                    break
                end
            end
        end
    end
    % end of selection

    population = newpop;

    disp('New population:');
    disp(newpop);

    % table of indices of chromosomes for crossover
    toCrossover = [];
    for n = 1:poplen
        if rand <= Pc
            toCrossover(length(toCrossover) + 1) = n;
        end
    end

    disp(strcat('to crossover (',int2str(length(toCrossover)),' chromosomes):'));
    if rem(length(toCrossover), 2) ~= 0
        % add one additional chromosome
        n = ceil(rand * poplen);
        while length(find(toCrossover == n)) > 0
            n = ceil(rand * poplen);
        end
        toCrossover(length(toCrossover) + 1) = n;
    end
    disp(strcat('indices of to crossover (',int2str(length(toCrossover)),' chromosomes):'));
    disp(toCrossover);



    % Table of indices (pairs)
    pairs = randperm(length(toCrossover));

    disp('Pairs:');
    disp(pairs);

    % Indices of already crossovered chromosomes
    done = [];
    for n = 1:length(toCrossover)
        if find(done == toCrossover(n))
            continue
        end
        
        % crossover point
        cp = ceil(rand * (chromlen - 1));
        parent1 = toCrossover(n);
        parent2 = toCrossover(pairs(n));
        child1 = strcat(population(parent1,1:cp), population(parent2,cp+1:chromlen));
        child2 = strcat(population(parent2,1:cp), population(parent1,cp+1:chromlen));
        population(parent1,:) = child1;
        population(parent2,:) = child2;
        done(length(done) + 1) = parent1;
        done(length(done) + 1) = parent2;
    end

    disp('pop after crossover:');
    disp(population);

    disp('performing mutation');
    % mutation
    for n = 1:poplen
        c = population(n,:);
        for locus = 1:chromlen
            if rand <= Pm
                % perform mutation
                if c(locus) == 0
                    c(locus) = '1';
                else
                    c(locus) = '0';
                end
            end
        end
        population(n,:) = c;
    end

    %disp('pop after current epoch:');
    %showpop(population,xmin,xmax,coding);   
    
    x = phenotype(population,xmin,xmax, coding);
    fvalues = eval(fitness);
    plot(x, fvalues, 'ro');
    MOVIE(epoch) = getframe;

end

bestx = [bestx x(find(fvalues==max(fvalues), 1))];
besty = [besty max(fvalues)];
avgy  = [avgy sum(fvalues)/length(fvalues)];
worsty = [worsty min(fvalues)];

movie(MOVIE, 5, 10);

figure()
hold on;
plot(1:length(besty), besty, 'ro-');
plot(1:length(avgy), avgy, 'go-');
plot(1:length(worsty), worsty, 'bo-');
legend('Best', 'Avg', 'Worst');

disp('best solution (argument):');

disp(bestx(find(besty == max(besty), 1)));

disp('value:');
disp(max(besty));
