% funkcja ta dokonuje mutacji chromosomu 
function offspring = createOffspring(chromosome, mutation, ro)
offspring = chromosome;

if (strcmp('gauss', mutation))
    k = randn(1,4);
    offspring = chromosome + ro * k;
else
    for locus =1:length(chromosome)
        gen = chromosome(locus);
        val = rand;
        val = val * 2 -1;
        gen = gen + val;
        offspring(locus) = gen; 
    end
end



 
