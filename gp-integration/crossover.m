%
% Robert Nowotniak (C) 2008
%

function [ result1, result2 ] = crossover( tree1, tree2, maxdepth )

nodes1 = tree2array(tree1);
nodes2 = tree2array(tree2);

found = false;
while ~found
    subtree1 = nodes1(ceil(length(nodes1) * rand));
    subtree2 = nodes2(ceil(length(nodes2) * rand));
    if  subtree1.depth + subtree2.subh <= maxdepth
        found = true;
    end
end
st = findSubtree( tree2, subtree2.id );
result1 = setChild(tree1, subtree1, st);
result1 = setIds(result1);

found = false;
while ~found
    subtree1 = nodes1(ceil(length(nodes1) * rand));
    subtree2 = nodes2(ceil(length(nodes2) * rand));
    if  subtree2.depth + subtree1.subh <= maxdepth
        found = true;
    end
end
st = findSubtree( tree1, subtree1.id );
result2 = setChild(tree2, subtree2, st);
result2 = setIds(result2);




function [ result ] = findSubtree( tree1, id )
if tree1(1).id == id
    result = tree1(1);
    return
end
if isstruct(tree1(1).arg)
    result = findSubtree( tree1.arg, id );
    if isstruct(result)
        return
    end
end
if isstruct(tree1(1).arg2)
    result = findSubtree( tree1.arg2, id );
    if isstruct(result)
        return
    end
end
result = -1;





function [ result ] = setChild( tree1, subtree1, st )

if tree1(1).id == subtree1.parentid
    if subtree1.id == 0
        result = st;
        return;
    elseif tree1(1).arg.id == subtree1.id
        tree1(1).arg = st;
    elseif tree1(1).arg2.id == subtree1.id
        tree1(1).arg2 = st;
    else
        disp('ERROR');
    end
    result = tree1;
    return;
end

if isstruct(tree1(1).arg)
    tree1(1).arg = setChild(tree1.arg, subtree1, st);
end
if isstruct(tree1(1).arg2)
    tree1(1).arg2 = setChild(tree1.arg2, subtree1, st);
end

result = tree1;




