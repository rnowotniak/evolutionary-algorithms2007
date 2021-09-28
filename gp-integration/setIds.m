%
% Robert Nowotniak (C) 2008
%

function [ result, lastid ] = setIds( tree1, varargin )

if length(varargin) == 0
    id = 0;
else
    id = varargin{1};
end

tree1(1).id = id;

if isstruct(tree1(1).arg);
    [tree1(1).arg, id] = setIds(tree1(1).arg, id + 1);
end
if isstruct(tree1(1).arg2);
    [tree1(1).arg2, id] = setIds(tree1(1).arg2, id + 1);
end

result = tree1(1);
lastid = id;
