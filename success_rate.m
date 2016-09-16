% Cluster settings
cd '/home/aleman/GD_exploration'

% parallelisation option 

parpool(4);

% Use parfor instead of for, note that in this example
% we should use an array cell instead of a vector for the estimation
% errors. (sliced variable).

% - - - - 

% Parameters

step_size = 0.5;
lower_limit = 0.5;
upper_limit = 3.5;

% dimensions = [20, 40, 80, 160, 320];
dim = 20;
learningRate = 1;
w0_norm = 3;
iterations = 1000; % GD iterations, paper value = 10^4
trials = 10; % number of different weight initializations for each random model, paper value = 10

epsilon = 0.001; % default = 0.001
n_instances = 100; % default = 100

% - - - - 

% storage

success_rate_size = [0.5, 1, 1.5];%lower_limit:step_size:upper_limit;
success_rate_values = zeros(length(success_rate_size), 1);

% - - - - 
index = 1;
% let n_d = n / d, n = sample size, d = dimension
for n_d = success_rate_size
    
    % Think about iterating in another way to avoid using floor function
    n_samples = floor(dim * log(dim) * n_d);
    
    sample_variances = zeros(n_instances, 1);
    
    parfor i = 1:n_instances
        
        sample_variances(i) = CE_sample_var(dim, n_samples, w0_norm, learningRate, iterations, trials);
        
    end
    
    %sample_variances
    % care in the index normalization n_d / step_size given the step size
    success_rate_values(index) = sum(sample_variances <= epsilon) / n_instances;
    index = index + 1;

end


save('Pr_CE_success_rate_d=160', 'success_rate_values', 'dim', 'iterations');