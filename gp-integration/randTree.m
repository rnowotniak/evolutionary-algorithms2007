%
% Robert Nowotniak (C) 2008
%

function [ result ] = randTree( minh, maxh )
    if minh == maxh
        height = minh;
    else
        height = floor(minh+rand*((maxh-minh)+1));
    end
    
    if height <= 0
         maxrand = 10;
         minrand = -10;
         if rand > 0.5
             result.val = 'x';
         else
             result.val = num2str((maxrand - minrand) * rand + minrand);
         end
         result.arg = '';
         result.arg2 = '';
         return
    end
    
    opers = strvcat('+', '-', 'un-', '.*', './', '.^', 'log', 'sqrt', 'sin', 'cos', 'atan', 'pi', 'const', 'x');
    %opers = strvcat('+', '-', 'un-', '.*', './', '.^', 'log', 'sqrt', 'sin', 'atan', 'pi', 'const', 'x');
  
    op = strtrim(opers(ceil(rand * length(opers)), :));
    
    switch op
        case {'+', '-', '.*', './', '.^'}
            result.val = op;
            result.arg = randTree(height - 1, height - 1);
            result.arg2 = randTree(height - 1, height - 1);
        case 'un-'
            result.val = '-';
            result.arg = randTree(height - 1, height - 1);
            result.arg2 = '';
        case {'sqrt', 'sin', 'cos', 'exp', 'atan', 'log'}
            result.val = op;
            result.arg = randTree(height - 1, height - 1);
            result.arg2 = '';
        case {'pi', 'x'}
            result.val = op;
            result.arg = '';
            result.arg2 = '';
        case 'const'
            maxrand = 10;
            minrand = -10;
            result.val = num2str((maxrand - minrand) * rand + minrand);
            result.arg = '';
            result.arg2 = '';
    end
    
    result = setIds(result);

