
function showpop(p, xmin, xmax, ymin, ymax, coding, locus2)
for n = 1:length(p(:,1))
    x = phenotype(p(n,:), xmin, xmax, ymin, ymax, coding, locus2);
    y = phenotype(p(n,:), xmin, xmax, ymin, ymax, coding, locus2);
    disp(strcat(p(n,:), ' phenotype:   ', num2str(x), ',', num2str(y)));
end