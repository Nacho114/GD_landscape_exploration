% Cluster settings
cd '/home/aleman/GD_exploration'

% parallelisation option 

parpool(2);

% Use parfor instead of for, note that in this example
% we should use an array cell instead of a vector for the estimation
% errors. (sliced variable).

% - - - - 

% Parameters

step_size = 100;
lower_limit = 0;
upper_limit = 600;

dimensions = [10];%, 20, 40, 80, 160];

learningRate = 1;
w0_norm = 1;
iterations = 100; % GD iterations, paper value = 10^4

n_instances = 10; % default = 100

% - - - - 

% Constants

n_d = 20; % n / d = 20

% storage

num_itr = lower_limit:step_size:upper_limit;

dist_vs_num_itr_cell = cell(length(dimensions), 1);

index = 1;
% - - - - 

% iterate over the dimensions

for dim = dimensions
    
    % variable to store the distance of each iteration
    
    dist_vs_num_itr_values = zeros(length(num_itr), 1);
    in_index = 1;
    
    % iterate over the x axis (number of iterations)
    
    for itr = num_itr
        
        n_samples = n_d * dim;
        
        iteration_distances = zeros(n_instances, 1);
        
        % iterate over the n_instances (==100) instances to get an average distance 
       
        for j = 1:n_instances      
            
            [w0, B0, x, y] = generateModel(dim, n_samples, w0_norm);
            init_weights = 1 / sqrt(sqrt(dim)) * randn(dim, 1);
            [w_est] = GD_v(x, y, init_weights, learningRate, itr, B0);
            iteration_distances(j) = estimation_error(w_est, w0);

        end
        
        % Take the average between the (0.05, 0.95) quantiles
        
        lower_quantile = quantile(iteration_distances, 0.05);
        upper_quantile = quantile(iteration_distances, 0.95);
        
        dist_vs_num_itr_values(in_index) = iteration_distances( iteration_distances > lower_quantile & iteration_distances < upper_quantile );
        
        dist_vs_num_itr_values(in_index) = sum(dist_vs_num_itr_values(in_index)) / length(dist_vs_num_itr_values(in_index));
        
        in_index = in_index + 1;
        
    end
    
    dist_vs_num_itr_cell{index} = dist_vs_num_itr_values;
    
    index = index + 1;
    
end

save('distance_vs_number_of_iterations', 'dist_vs_num_itr_cell', 'dimensions', 'iterations', 'lower_limit', 'step_size', 'upper_limit', 'dimensions');