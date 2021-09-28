function drawCykloid(pointA, pointB)

%plot([pointA(1,1),pointB(1,1)],[pointA(2,1),pointB(2,1)],'ro')

%wyznaczenie promienia
road = (pointA(1,1) - pointB(1,1))*(pointA(1,1) - pointB(1,1)) + (pointA(2,1) - pointB(2,1))*(pointA(2,1) - pointB(2,1));
road = sqrt(road);
wsp = floor(road / 10);
wsp = 0.1 * wsp;
if wsp == 0
    wsp = 0.1;
end

r = road;
% obliczenie podstawowej cykloidy
t = [0:1:360];
t = pi * t / 180;
sint = sin(t);
cost = cos(t);
x = r * (t - sint);
y = r * (1 - cost);

% przesuniecie podstawowej brachistochrony
% tak aby jej prawy skrajny punkt odpowiadal punktowi B
% podanemu przez uzytkownika
minx = min (x);
if (minx > pointA(1,1))
    x = x - (minx - pointA(1,1));
else
    x = x + (pointA(1,1) - minx);
end;
y = y + pointA(2,1);

% odbicie symetryczne wzdloz osi poziomej w pionie
yos = pointA(2,1); 
for i = 1:length(y)
   y(i) = 2 * yos - y(i); 
end

%plot (x,y,'r')

% obliczenie punktu przeciecia podstawowej cykloidy

xa = pointA(1,1);
ya = pointA(2,1);
xb = pointB(1,1);
yb = pointB(2,1);

a = (yb - ya) / (xb - xa);
b = ya - a * xa;
yf = [];
for i = 1:length(x)
    val = a * x(i) + b;
    yf = [yf,val];
end
index = 1;
for i = 2:length(y)
   if (abs (y(i) - yf(i)) <= wsp) && (x(i) >= xb)
       index = i;
   end
end
if (index == 1)
    xc = xb;
    yc = yb;
else
    xc = x(index);
    yc = yf(index);
end
newR = sqrt( (xc - xa) * (xc - xa) + (yc - ya) * (yc - ya) );
newR = r * road / newR;
r = newR;
% rysowanie cykloidy przechodzacej przez punkt B
x = r * (t - sint);
y = r * (1 - cost);

minx = min (x);
if (minx > pointA(1,1))
    x = x - (minx - pointA(1,1));
else
    x = x + (pointA(1,1) - minx);
end;
y = y + pointA(2,1);
yos = pointA(2,1);
index = 0;
for i = 1:length(y)
   if ((x(i) > xb) && index == 0)
       index = i;
   end
   y(i) = 2 * yos - y(i); 
end
x = x(1:index);
y = y(1:index);

fitness = calculateFitness([x;y]);
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');

disp('      przystosowanie przykladowej brachistochrony');
fitness
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');

plot (x,y,'m')