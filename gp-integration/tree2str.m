%
% Robert Nowotniak (C) 2008
%

function [ result ] = tree2str( node )

if not(isstruct(node)) || sum(size(node(1).val) == [0 0]) == 2
    disp('ERROR!!!;/');
    result = -1;
    return
end

switch node(1).val
    case {'+', '.*', './', '.^'}
        result = strcat('(', tree2str(node(1).arg), ')', node(1).val, '(', tree2str(node(1).arg2), ')');
    case '-'
        if isstruct(node(1).arg2) || not(strcmp(node(1).arg2,''))
            % binary -
            result = strcat('(', tree2str(node(1).arg), ')', node(1).val, '(', tree2str(node(1).arg2), ')');
        else
            % unary -
            result = strcat('-(', tree2str(node(1).arg), ')');
        end
    case {'sqrt', 'sin', 'cos', 'exp', 'atan', 'log'}
            result = strcat(node(1).val, '(', tree2str(node(1).arg), ')');
    otherwise
        result = node(1).val;
end

