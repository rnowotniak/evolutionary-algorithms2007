%
% Robert Nowotniak (C) 2008
%

function [ result ] = mutate( node, maxdepth )


r = rand;
if r < 0.2
    % hoist
    nodes = tree2array(node);
    % random node info
    change = nodes(ceil(length(nodes) * rand));
    subtree = findSubtree(node, change.id);
    result = setIds(subtree);
elseif r < 0.4
    % change order of arguments
    nodes = tree2array(node);
    % random node info
    change = nodes(ceil(length(nodes) * rand));
    subtree = findSubtree(node, change.id);
    if isstruct(subtree(1).arg2)
        tmp = subtree(1).arg;
        subtree(1).arg = subtree(1).arg2;
        subtree(1).arg2 = tmp;
    else
        result = node;
        return;
    end
    result = setChild(node, change, subtree);
    result = setIds(result);
elseif r < 0.6
    % put x in place of random node
    nodes = tree2array(node);
    change = nodes(ceil(length(nodes) * rand));
    newnode.val = 'x';
    newnode.arg = '';
    newnode.arg2 = '';
    result = setChild(node, change, newnode);
    result = setIds(result);
elseif r < 0.8
    % insert random subtree in random position
    nodes = tree2array(node);
    change = nodes(ceil(length(nodes) * rand));
    newnode = randTree(1, maxdepth - change.depth);
    result = setChild(node, change, newnode);
    result = setIds(result);
else
    nodes = tree2array(node);
    if nodes(1).subh == maxdepth
        % already maximum height
        result = node;
        return
    end
    
    % scale vertically
    newnode(1).val = '.*';
    newnode(1).arg.val = num2str(6 * rand - 3);
    newnode(1).arg.arg = '';
    newnode(1).arg.arg2 = '';
    newnode(1).arg2 = node;
    result = newnode;
    result = setIds(result);
end




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

