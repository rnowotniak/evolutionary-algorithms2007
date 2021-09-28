%
% Robert Nowotniak (C) 2008
%

function [ result ] = findValInTree( node, val )
if node(1).val == val
    result = node(1);
    return
end
if isstruct(node(1).arg)
    result = findValInTree(node(1).arg, val);
    if isstruct(result)
        return
    end
end
if isstruct(node(1).arg2)
    result = findValInTree(node(1).arg2, val);
    if isstruct(result)
        return
    end
end
result = -1;
