%
% Robert Nowotniak (C) 2008
%

set(0,'RecursionLimit',400);
warning('OFF', 'Divide by zero');
warning off verbose;
warning off backtrace;


%
%     TEST CASES
% 
% % genetic algorithm parameters
% Pc = 0.75;
% Pm = 0.10;
% poplen = 30;
% maxdepth = 4;
% ITERATIONS = 400;
% 
% xmin = 0.01;
% xmax = 5;
% fun = 'sin(x) ./ (x+1).^2';
% % funkcja podcalkowa
% discr = 20;
% delta = 0.001;
% 
% 
% % genetic algorithm parameters
% Pc = 0.80;
% Pm = 0.5;
% poplen = 20;
% maxdepth = 4;
% ITERATIONS = 400;
% 
% xmin = -3;
% xmax = 3;
% fun = 'exp(-(x.^2))';
% % funkcja podcalkowa
% discr = 30;
% delta = 0.001;
% 
% 
% 
% % genetic algorithm parameters
% Pc = 0.75;
% Pm = 0.10;
% poplen = 30;
% maxdepth = 4;
% ITERATIONS = 400;
% 
% xmin = -5;
% xmax = 5;
% fun = 'sin(sin(x) + x)';
% % funkcja podcalkowa
% discr = 20;
% delta = 0.001;
% 
% % genetic algorithm parameters
% Pc = 0.50;
% Pm = 0.40;
% poplen = 30;
% maxdepth = 5;
% ITERATIONS = 400;
% 
% xmin = 1.5;
% xmax = 8;
% fun = 'sin(x) ./ log(x)';
% % funkcja podcalkowa
% discr = 20;
% delta = 0.001;
% 
% 
% % genetic algorithm parameters
% Pc = 0.75;
% Pm = 0.1;
% poplen = 20;
% maxdepth = 4;
% ITERATIONS = 200;
% 
% xmin = -3;
% xmax = 3;
% fun = 'x+sin(x)';
% % funkcja podcalkowa
% discr = 20;
% delta = 0.001;
% 
% % genetic algorithm parameters
% Pc = 0.80;
% Pm = 0.5;
% poplen = 30;
% maxdepth = 4;
% ITERATIONS = 400;
% 
% xmin = 0.01;
% xmax = 6;
% fun = 'x.*sin(x)';
% % funkcja podcalkowa
% discr = 20;
% delta = 0.001;


root2.val = '-';
root2.arg.val = '.*';
root2.arg.arg.val = '0.5';
root2.arg.arg.arg = '';
root2.arg.arg.arg2 = '';
root2.arg.arg2.val = '.^';
root2.arg.arg2.arg.val = 'cos';
root2.arg.arg2.arg.arg.val = 'x';
root2.arg.arg2.arg.arg.arg = '';
root2.arg.arg2.arg.arg.arg2 = '';
root2.arg.arg2.arg.arg.arg2 = '';
root2.arg.arg2.arg.arg2 = '';
root2.arg.arg2.arg2.val = '2';
root2.arg.arg2.arg2.arg = '';
root2.arg.arg2.arg2.arg2 = '';
root2.arg2 = '';
root2 = setIds(root2);

cheat.val = '+';
cheat.arg = root2;
cheat.arg2.val = '0';
cheat.arg2.arg = '';
cheat.arg2.arg2 = '';
cheat = setIds(cheat);

root.val = '.*';
root.arg.val = 'sin';
root.arg.arg.val = 'x';
root.arg.arg.arg = '';
root.arg.arg.arg2 = '';
root.arg.arg2 = '';
root.arg2.val = 'cos';
root.arg2.arg.val = 'x';
root.arg2.arg.arg = '';
root.arg2.arg.arg2 = '';
root.arg2.arg2 = '';
root = setIds(root);

%0.4+0.6*cos(0.7*x)
cheat2.val = '+';
cheat2.arg.val = '0.4';
cheat2.arg.arg = '';
cheat2.arg.arg2 = '';
cheat2.arg2.val = '.*';
cheat2.arg2.arg.val = '0.6';
cheat2.arg2.arg.arg = '';
cheat2.arg2.arg.arg2 = '';
cheat2.arg2.arg2.val = 'cos';
cheat2.arg2.arg2.arg.val = '.*';
cheat2.arg2.arg2.arg.arg.val = '0.7';
cheat2.arg2.arg2.arg.arg.arg = '';
cheat2.arg2.arg2.arg.arg.arg2 = '';
cheat2.arg2.arg2.arg.arg2.val = 'x';
cheat2.arg2.arg2.arg.arg2.arg = '';
cheat2.arg2.arg2.arg.arg2.arg2 = '';
cheat2.arg2.arg2.arg2 = '';
cheat2 = setIds(cheat2);

% 0.5*x.^2 + log(x)
cheat3.val = '+';
cheat3.arg.val = '.*';
cheat3.arg.arg.val = '0.5';
cheat3.arg.arg.arg = '';
cheat3.arg.arg.arg2 = '';
cheat3.arg.arg2.val = '.^';
cheat3.arg.arg2.arg.val = 'x';
cheat3.arg.arg2.arg.arg = '';
cheat3.arg.arg2.arg.arg2 = '';
cheat3.arg.arg2.arg2.val = '2';
cheat3.arg.arg2.arg2.arg = '';
cheat3.arg.arg2.arg2.arg2 = '';
cheat3.arg2.val = 'log';
cheat3.arg2.arg.val = 'x';
cheat3.arg2.arg.arg = '';
cheat3.arg2.arg.arg2 = '';
cheat3.arg2.arg2 = '';
cheat3b.val = '+';
cheat3b.arg = cheat3;
cheat3b.arg2.val = '.*';
cheat3b.arg2.arg.val = '0.1';
cheat3b.arg2.arg.arg = '';
cheat3b.arg2.arg.arg2 = '';
cheat3b.arg2.arg2.val = 'x';
cheat3b.arg2.arg2.arg = '';
cheat3b.arg2.arg2.arg2 = '';
cheat3b = setIds(cheat3b);



x = [xmin:(xmax-xmin)/(discr-1):xmax];

% wartosci funkcji podcalkowej
% -- pochodna funkcji pierwotnej ma sie z tym rownac
y = eval(fun);


clear population

% generate a random population of trees
for p = 1:poplen
    while true
        population(p) = randTree(2, 3);
        if isstruct(population(p).arg)
            % avoid too simple trees (root is a constant node)
            break
        end
    end
end

%population(3) = cheat;

cla;
hold on;

besterr = inf;

epoch = 0;
% outer loop of GP
while true
    % compute least squares
    errors = [];
    for p = 1:poplen
        % compute derivative of individual (the argument of integrate)
        x = x - delta;
        yb = eval(tree2str(population(p)));
        x = x + 2 * delta;
        yf = eval(tree2str(population(p)));
        x = x - delta;
        % forward difference quotient -- numerical computed derivative
        deriv = (yf-yb)/(2 * delta);
        
        % difference between (numericaly computed) derivative
        dif = abs(y - deriv);
        err = 0;
        for s = 1:length(dif)
            if isfinite(dif(s))
                err = err + dif(s).^2;
            elseif isnan(dif(s))
                err = inf;
                break
            elseif isinf(dif(s))
                err = err + 1000; % penalty
            else
                err = err + 10; % penalty
            end
        end
        errors(p) = err;
        if min(deriv) == max(deriv)
            errors(p) = 1000 .* errors(p);
        end
        if length(yb(~isnan(yb))) == 0
            errors(p) = inf;
        end
    end
    errors = abs(errors);
    for s = 1:length(errors)
        if isinf(errors(s))
            errors(s) = max(errors(~isinf(errors)))*10;
        end
    end

    if min(errors) == max(errors)
        disp(' *******************************');
        disp(' ***  STAGNATION. Aborting  *** ');
        disp(' *******************************');
        break
    end
    
    ranking = sortrows([[1:poplen]' errors'], [2]);
    if ranking(1,2) <= besterr
        best = population(ranking(1,1));
        besterr = ranking(1,2);
    end
        

    % ranking method
    probs = exp(-0.5.*(3.5.*((poplen+1-[1:poplen])/poplen-1)).^2).^2;
    sects = probs;
    sects = sects / sum(sects);
    % make a permutation acording to ranking
    for p = 1:poplen
        tmp(ranking(p,1)) = sects(p);
    end
    sects = tmp;
    % transform sections to accumulated values
    for n = 2:length(sects)
        sects(n) = sects(n - 1) + sects(n);
    end

    
    if mod(epoch, 4) == 0
        % draw the plot
        cla;
        plot(x, y, 'r+-'); % draw integrate argument function (f)
        x = x - delta;
        yb = eval(tree2str(best));
        x = x + 2 * delta;
        yf = eval(tree2str(best));
        x = x - delta;
        deriv = (yf-yb)/(2 * delta);
        plot(x, deriv, 'bs-');
        axis([xmin xmax min(y) max(y)]);
        drawnow;
        
        disp(strcat('Current best solution:', tree2str(best)));
    end
    
    
    epoch = epoch + 1;
    if epoch > ITERATIONS
        break
    end
    if besterr < 0.01
        disp('*** Very good solution found! ***');
        break
    end
    
    disp(strcat('ITERATION ', num2str(epoch)));
    
    
    newpop = struct('val', {}, 'arg', {}, 'arg2', {}, 'id', {});
    % inner loop of GP
    while length(newpop) < poplen
        
        
        % select genetic operation
        r = rand;
        if r < Pc
            % CROSSOVER
            
            par1 = 1;
            par2 = 1;
            r1 = rand;
            r2 = rand;
            while par1 < poplen
                if r1 <= sects(par1)
                    break
                end
                par1 = par1 + 1;
            end
            while par2 < poplen
                if r2 <= sects(par2)
                    break
                end
                par2 = par2 + 1;
            end

            [child1, child2] = crossover(population(par1), population(par2), maxdepth);
            newpop = [newpop child1 child2];

        elseif r < Pc + Pm
            % mutation
            ind = 1;
            r1 = rand;
            while ind < poplen
                if r1 <= sects(ind)
                    break
                end
                ind = ind + 1;
            end
            newpop = [newpop mutate(population(ind), maxdepth)];
        else
            % reproduction
            ind = 1;
            r1 = rand;
            while ind < poplen
                if r1 <= sects(ind)
                    break
                end
                ind = ind + 1;
            end
            newpop = [newpop population(ind)];
        end
    end
        
    population = newpop(1:poplen); 
    
end

disp('Ostateczna populacja:');
for p = 1:poplen
    disp(tree2str(population(p)));
end

%clf
%hold on
cla;
plot(x, eval(tree2str(best)), 'y-'); % draw found solution
plot(x, eval(fun), 'r+-'); % draw correct function (integrate argument)

x = x - delta;
yb = eval(tree2str(best));
x = x + 2 * delta;
yf = eval(tree2str(best));
x = x - delta;
deriv = (yf-yb)/(2 * delta);
% draw derivative of found solution
plot(x, deriv, 'bs-');
axis([xmin xmax min(y) max(y)]);
legend('F', 'f', 'F''');

disp('');
disp('Wzor najlepszej funkcji:');
disp(tree2str(best));
disp('Blad sredniokwadratowy:');
disp(besterr);







