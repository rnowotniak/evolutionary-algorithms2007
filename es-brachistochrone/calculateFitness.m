% Liczymy przystosowanie dla krzywej beziera podanej w postaci punktow [X;Y]

function fitness = calculateFitness(bezierPoints)
fitness = 0;

gravity = 9.80665;

acceleration = gravity;
speedBegin = 0;
speedEnd = 0;

pointBegin = [bezierPoints(1,1), bezierPoints(2,1)];

for i = 2:length(bezierPoints)
    pointEnd = [[bezierPoints(1,i), bezierPoints(2,i)]];
    road = (pointBegin(1) - pointEnd(1))*(pointBegin(1) - pointEnd(1)) + (pointBegin(2) - pointEnd(2))*(pointBegin(2) - pointEnd(2));
    road = sqrt(road);
    
    if pointBegin(2) > pointEnd(2)
        %Punkt A lezy wyzej niz B zatem mammy ruch jednostajnie
        %przyspieszony
        acceleration = ((pointBegin(2) - pointEnd(2)) * gravity) / road;
        time = roots([acceleration, 2 * speedBegin, -2 * road]);
        timeMax = max(time);
        speedEnd = speedBegin + acceleration * timeMax;
    else
        %Punkt A lezy nizej niz B zatem mammy ruch jednostajnie
        %opozniony
        acceleration = ((pointEnd(2) - pointBegin(2)) * gravity) / road;
        time = roots([-acceleration, 2 * speedBegin, -2 * road]);
        timeMax = min(time);
        speedEnd = speedBegin - acceleration * timeMax;
    end
    fitness = fitness + timeMax;
    pointBegin = pointEnd;
    speedBegin = speedEnd;
end
if (imag(fitness) ~= 0)
   xa = bezierPoints(1,1);
   ya = bezierPoints(2,1);
   xb = bezierPoints(1,length(bezierPoints));
   yb = bezierPoints(2,length(bezierPoints));
   
   road = sqrt( (xa - xb)*(xa - xb) + (ya - yb)*(ya - yb) );
   acceleration = (ya - yb) * gravity / road;
   time = roots([acceleration,0, -2 * road]);
   fitness = max (time);
   
end
