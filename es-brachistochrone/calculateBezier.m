function bezierPoints = calculateBezier(points)
stepBezier = 0.01;
t = [0:stepBezier:1];
bezierTable = [-1, 3, -3, 1;
                3, -6, 3, 0;
               -3, 3, 0, 0;
                1, 0, 0, 0];
temp = points * bezierTable;

bezierPoints = [];
for n = 1:length(t)
    bezierT = [t(n).^3; t(n).^2; t(n); 1];
    bezierPoints = [bezierPoints, temp*bezierT];
end