% Cluster settings
cd '/home/aleman/GD_exploration'

poolobj = parpool(2);

dim = 60;

w0_norm = 1;
learningRate = 1;

itr = 10000;
batch_size = 100;

n_tests = 100; % number of tests per batch size

n_samples = 10000;
batch_sizes = [10, 100, 500, 1000, 4000];

error_list = zeros(length(batch_sizes), 1);

index = 1;

for b_s = batch_sizes

    errors = 0;
    
    parfor i = 1:n_tests
        
        [w0, B0, x, y] = generateModel(dim, n_samples, w0_norm);
        init_weights = 1 / sqrt(dim) * randn(dim, 1);
        
        w_est = GD_v(x, y, init_weights, learningRate, itr, B0);
        SGD_est = SGD(x, y, init_weights, learningRate, itr, B0, b_s);
        
        
        errors = errors + norm(SGD_est - w_est);
        
    end
    
    error_list(index) = errors / n_tests;
    index = index + 1;
end


save('SGD_vs_GD_4k', 'error_list')