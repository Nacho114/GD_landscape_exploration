% Cluster settings
cd '/home/aleman/GD_exploration'

% parallelisation option
parpool(8);

% Use parfor instead of for, note that in this example
% we should use an array cell instead of a vector for the estimation
% errors. (sliced variable).

% Parameters

step_size = 10;
lower_limit = 10;
upper_limit = 100;

dim = 40;
learningRate = 1;
w0_norm = 1;
iterations = 10000; % GD iterations, paper value = 10^4
trials = 10; % number of different weight initializations for each random model, paper value = 10


% storage
estimation_size = floor((upper_limit - lower_limit) / step_size);
estimation_errors = zeros(estimation_size, 1);


% let n_d = n / d, n = sample size, d = dimension
for n_d = lower_limit:step_size:upper_limit
    
    n_samples = dim * n_d;
    
    % care in the index normalization n_d / step_size given the step size
    estimation_errors(n_d / step_size) = sample_estimation_error(dim, n_samples, w0_norm, learningRate, iterations, trials);

end


save('estimation_error_d40_with_B0', 'estimation_errors', 'dim', 'iterations');
