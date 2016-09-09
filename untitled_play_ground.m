

w0_norm = 1;
n_samples = 10;

learningRate = 1;
iterations = 1;
trials = 10;
dimensions = [5, 10];

success_rate_cell = cell(length(dimensions), 1);

index = 1;
 
for dim = dimensions
    success_rate_cell{index} = sample_var(dim, n_samples, w0_norm, learningRate, iterations, trials);
    success_rate_cell{index}
    index = index + 1;
end

