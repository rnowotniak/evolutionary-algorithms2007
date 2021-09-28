function [ population ] = selectionFunc( population, seltype, fvalues, reqpoplen )

s = size(population);
poplen = s(1);
if strcmp(seltype, 'tournament')
    % tournament seltype
    newpopqty = 0;
    newpop = [];
    while newpopqty < reqpoplen
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
elseif strcmp(seltype, 'ranking')
    % ranking seltype
    %     ranking = [];
    %     ranking(:,1) = [1:1:poplen]';
    %     ranking(:,2) = fvalues;
    %     ranking = sortrows(ranking, [-2]);
    %  (dopisac f-cje p-stwa)
    % end of ranking seltype
    % elseif strcmp(seltype, 'kolejna_metoda_selekcji')
else
    % prepare for roulette seltype
    % transform fitnes values to non-negative numbers
    sects = fvalues;
    if min(sects) < 0
        sects = sects - min(sects);
    end
    %disp(sects);

    % compute roulette sections for each chromosome
    s = sum(sects);
    if s == 0
        sects = sects + 1;
        s = sum(sects);
    end
    sects = sects / s;
    

    %disp(sects);

    % transform sections to accumulated values
    for n = 2:length(sects)
        sects(n) = sects(n - 1) + sects(n);
    end

    %disp(sects);

    % seltype - prepare new population
    newpop = [];
    for n = 1:reqpoplen
        r = rand;
        for i = 1:length(sects)
            if r <= sects(i)
                newpop = strvcat(newpop, population(i,:));
                break
            end
        end
    end
end

population = newpop;
% end of selection