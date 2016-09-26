% Cluster settings
cd '/home/aleman/GD_exploration'

% parallelisation option 

parpool(16);

% Use parfor instead of for, note that in this example
% we should use an array cell instead of a vector for the estimation
% errors. (sliced variable).

% - - - - 

% Parameters

step_size = 0.5;
lower_limit = 0.5;
upper_limit = 3.5;

dimensions = [20, 40, 80, 160, 320];

learningRate = 1;
w0_norm = 3;
iterations = 10000; % GD iterations, paper value = 10^4
trials = 10; % number of different weight initializations for each random model, paper value = 10

epsilon = 0.001; % default = 0.001
n_instances = 100; % default = 100

% - - - - 

% storage

n_d_itr = lower_limit:step_size:upper_limit;

success_rate_size = length(n_d_itr);

success_rate_cell = cell(length(dimensions), 1);

index = 1;
% - - - - 

for dim = dimensions
    
    success_rate_values = zeros(success_rate_size, 1);
    in_index = 1;
    % let n_d = n / d, n = sample size, d = dimension
    for n_d = n_d_itr
        
        n_samples = floor(dim * log(dim) * n_d);
        
        sample_variances = zeros(n_instances, 1);
        
        parfor i = 1:n_instances
            
            sample_variances(i) = CE_sample_var(dim, n_samples, w0_norm, learningRate, iterations, trials);

        end
        
       
        success_rate_values(in_index) = sum(sample_variances <= epsilon) / n_instances;
        in_index = in_index + 1;
        
    end
    
    success_rate_cell{index} = success_rate_values;
    
    index = index + 1;
    
end

save('CE_success_rate_iterations_sqrtd', 'success_rate_cell', 'dimensions', 'iterations', 'lower_limit', 'step_size', 'upper_limit', 'dimensions');