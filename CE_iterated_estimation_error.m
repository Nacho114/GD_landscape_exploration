% Cluster settings
cd '/home/aleman/GD_exploration'

% parallelisation option
parpool(16);

% Use parfor instead of for, note that in this example
% we should use an array cell instead of a vector for the estimation
% errors. (sliced variable).

dimensions = [5, 10, 20, 40, 80];

% Parameters

step_size = 10;
lower_limit = 10;
upper_limit = 100;


learningRate = 1;
w0_norm = 1;
iterations = 10000; % GD iterations, paper value = 10^4
trials = 100; % number of different random models, paper value = 100 // Note, different from trial meaning of Success rate


% storage
itr_nd = lower_limit:step_size:upper_limit;

estimation_error_cell = cell(length(dimensions), 1);

index = 1;

for dim = dimensions
    
    estimation_errors = zeros(length(itr_nd), 1);

    in_index = 1;

    % let n_d = n / d, n = sample size, d = dimension
    for n_d = itr_nd
        
        n_samples = dim * n_d;
        
        
        estimation_errors(in_index) = CE_sample_estimation_error(dim, n_samples, w0_norm, learningRate, iterations, trials);
        in_index = in_index + 1;
    end
    
    estimation_error_cell{index} = estimation_errors;
    index = index + 1;

end

save('CE_estimation_error_iterations', 'estimation_error_cell', 'dimensions', 'iterations', 'lower_limit', 'step_size', 'upper_limit');
