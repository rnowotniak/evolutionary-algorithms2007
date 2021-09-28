%
% Robert Nowotniak (C) 2008
%

function [ result ] = tree2array( node, varargin )

if length(varargin) == 0
    depth = 0;
    parentid = 0;
else
    depth = varargin{1};
    parentid = varargin{2};
end

% Conver tree to array of all nodes
result(1).id = node(1).id;
result(1).subh = 0;
result(1).depth = depth;
result(1).parentid = parentid;

subh = 0;
if isstruct(node(1).arg)
    a = tree2array(node(1).arg, depth + 1, node(1).id);
    result = [result a];
    subh = a(1).subh + 1;
end
if isstruct(node(1).arg2)
    a = tree2array(node(1).arg2, depth + 1, node(1).id);
    result = [result a];
    subh = max([subh (a(1).subh + 1)]);
end
result(1).subh = subh;
