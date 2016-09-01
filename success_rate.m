% Cluster settings
cd '/home/aleman/GD_exploration'

% parallelisation option 

% parpool(32);

% Use parfor instead of for, note that in this example
% we should use an array cell instead of a vector for the estimation
% errors. (sliced variable).

% - - - - 

% Parameters

step_size = 0.5;
lower_limit = 0.5;
upper_limit = 3.5;

dimensions = [20, 40, 80, 160, 320];
dim = 5;
learningRate = 3;
w0_norm = 1;
iterations = 11; % GD iterations, paper value = 10^4
trials = 10; % number of different weight initializations for each random model, paper value = 10

epsilon = 3; % default = 0.001
n_instances = 100; % default = 100

% - - - - 

% storage

success_rate_size = floor((upper_limit - lower_limit) / step_size);
sucess_rate_values = zeros(success_rate_size, 1);

% - - - - 

% let n_d = n / d, n = sample size, d = dimension
for n_d = lower_limit:step_size:upper_limit
    
    % Think about iterating in another way to avoid using floor function
    n_samples = floor(dim * log(dim) * n_d);
    
    sample_variances = zeros(n_instances, 1);
    
    for i = 1:n_instances
        
        sample_variances(i) = sample_var(dim, n_samples, w0_norm, learningRate, iterations, trials);
    end
    
    % care in the index normalization n_d / step_size given the step size
    sucess_rate_values(n_d / step_size) = sum(sample_variances) / n_instances;%sum(sample_variances <= epsilon) / n_instances;
    

end


save('success_rate_d=20', 'sucess_rate_values', 'dim', 'iterations');