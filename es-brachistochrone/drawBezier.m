% parentBezierPoints - zawiera krzywa beziera;
% parentPoints zawiera punkty [A,B,C,D]
% parent jest to chromosom ktory zawiera punkty kontrolne
function drawBezier(parentPoints, parent, parentBezierPoints)
% rysowanie punktow kontrolnych - mozna wykasowac
    xF = [parentPoints(1,1),parent(1)];
    yF = [parentPoints(2,1),parent(2)];
    plot(xF, yF,'r');
    xF = [parentPoints(1,4),parent(3)];
    yF = [parentPoints(2,4),parent(4)];
    plot(xF, yF,'r');
    xF = [parent(1),parent(3)];
    yF = [parent(2),parent(4)];
    plot(xF,yF,'ro');
    xF = [parentPoints(1,1),parentPoints(1,4)];
    yF = [parentPoints(2,1),parentPoints(2,4)];
    plot(xF,yF,'go');
    
    % do tad jest rysowanie punktow kontrolnych - mozemy to wywalic
    
    x = parentBezierPoints(1,:);
    y = parentBezierPoints(2,:);
    plot(x,y);


