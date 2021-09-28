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
    xmin = -2;
    xmax = 2;
    ymin = 2;
    ymax = 2;
    poplen = 30;

    Pc = 0.95;
    Pm = 0.08;

    iterations = 20;
    precision = 5;
    coding = gray;

    chromlen = ceil(log((xmax-xmin) * 10^precision +1)/log(2));

    populations = [];

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
end

%clear MOVIE;

%disp('Population:');
%showPop(population, xmin, xmax, coding);

bestx = [];
besty = [];
bestval = [];
avgy = [];
worsty = [];

% number of epoch with no improvements
noimprov = 0;

for epoch = 1:iterations
    %cla;
    %fplot(fitness, [xmin xmax]);
    %hold on;

    if epoch == 1
        % compute fitness function values
        fvalues = [];
        [x,y] = phenotype(population, xmin, xmax, ymin, ymax, coding, locus2);
        fvalues = eval(fitness);
    elseif noimprov == 5
        disp('Stagnation on island!');
        break
    end

    if length(bestval) == 0 || max(fvalues) > max(bestval)
        noimprov = 0;
    else
        noimprov = noimprov + 1;
    end

    % best solution in current population
    bestx = [bestx x(find(fvalues==max(fvalues), 1))];
    besty = [besty y(find(fvalues==max(fvalues), 1))];
    bestval = [bestval max(fvalues)];
    avgy  = [avgy sum(fvalues)/length(fvalues)];
    worsty = [worsty min(fvalues)];

    %disp(fvalues);

    % selection
    reqpoplen = size(population, 1);
    population = selectionFunc(population, selection, fvalues, reqpoplen);
    %population = newpop;

    %disp('New population:');
    %disp(population);

    % table of indices of chromosomes for crossover
    toCrossover = [];
    for n = 1:poplen
        if rand <= Pc
            toCrossover(length(toCrossover) + 1) = n;
        end
    end

    %disp(strcat('to crossover (',int2str(length(toCrossover)),' chromosomes):'));
    if rem(length(toCrossover), 2) ~= 0
        % add one additional chromosome
        n = ceil(rand * poplen);
        while length(find(toCrossover == n)) > 0
            n = ceil(rand * poplen);
        end
        toCrossover(length(toCrossover) + 1) = n;
    end
    %disp(strcat('indices of to crossover (',int2str(length(toCrossover)),' chromosomes):'));
    %disp(toCrossover);



    % Table of indices (pairs)
    pairs = randperm(length(toCrossover));

    %disp('Pairs:');
    %disp(pairs);

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

    %disp('pop after crossover:');
    %disp(population);

    %disp('performing mutation');
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

    [x,y] = phenotype(population, xmin, xmax, ymin, ymax, coding, locus2);
    fvalues = eval(fitness);
    %plot(x, fvalues, 'ro');
    %MOVIE(epoch) = getframe;

end

bestx = [bestx x(find(fvalues==max(fvalues), 1))];
besty = [besty y(find(fvalues==max(fvalues), 1))];
bestval = [bestval max(fvalues)];
avgy  = [avgy sum(fvalues)/length(fvalues)];
worsty = [worsty min(fvalues)];

%movie(MOVIE, 5, 10);

% figure()
% hold on;
% plot(1:length(bestval), bestval, 'ro-');
% plot(1:length(avgy), avgy, 'go-');
% plot(1:length(worsty), worsty, 'bo-');
% legend('Best', 'Avg', 'Worst');


bestx = bestx(find(bestval == max(bestval), 1));
besty = besty(find(bestval == max(bestval), 1));
bestval = max(bestval);

%disp('best solution (argument):');
%disp(bestx);
%disp(besty);

%disp('value:');
%disp(bestval);
