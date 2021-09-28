

function showpop(p, a, b, coding)
for n = 1:length(p(:,1))
    disp(strcat(p(n,:),'  ->',num2str(phenotype(p(n,:),a,b,coding))));
end