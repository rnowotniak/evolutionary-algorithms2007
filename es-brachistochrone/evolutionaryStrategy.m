% do funkcji przekazujemy inicjalizacyjne punkty [A,B,C,D] gdzie A,D sa to
% punkty stale
function evolutionaryStrategy(parentPoints, steps, mutation, ro, cd)
% chromosom ma strukture [B.x,B.y,C.x,C.y]
parent = [parentPoints(1,2),parentPoints(2,2),parentPoints(1,3),parentPoints(2,3)];
parentBezierPoints = calculateBezier(parentPoints);
parentFitness = calculateFitness(parentBezierPoints);
bestFitness = parentFitness;
drawBezier(parentPoints, parent, parentBezierPoints);
disp('=============================================================================');
disp('Przystosowanie dla chromosomu bazowego czyli dla lini prostej');
parentFitness
disp('=============================================================================');
drawnow;
pause(1);
numberOfSuccessMutation = 0;
ci = 1/cd;

for i = 1:steps
    offspring = createOffspring(parent, mutation, ro);
    offspringBezierPoints = calculateBezier([parentPoints(:,1), [offspring(1);offspring(2)], [offspring(3);offspring(4)], parentPoints(:,4)]);
    
    %porownanie krzywej parentBezierPoints z offspringBezierPoints
    offspringFitness = calculateFitness(offspringBezierPoints);
    if (parentFitness > offspringFitness)
       best = i;
       bestFitness = offspringFitness;
       numberOfSuccessMutation = numberOfSuccessMutation + 1; 
       parentFitness = offspringFitness;
       parent = offspring;
       parentBezierPoints = offspringBezierPoints;
       % rysowanie krzywej beziera
        cla;
        drawBezier(parentPoints, parent, parentBezierPoints);
        drawnow;
        pause(1);
    end
    
    if (numberOfSuccessMutation < i/5)
        ro = cd * ro;
    elseif (numberOfSuccessMutation > i/5)
        ro = ro * ci;
    end
    
end
disp('najlepszy uzyskany wynik to ');
bestFitness