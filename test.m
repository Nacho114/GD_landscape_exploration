% default setting for sigmoid
sigm_def = [1, 0]; 



% parameters

n_samples = 10;
dim = 5;
learningRate = 0.01;
iterations = 1;

% initialize model 



n_tests = 1000000;
win = 0;
list = cell(n_test, 1);
for i = 1:n_tests
    
    init_weights = 1 / sqrt(sqrt(dim)) * randn(dim, 1);
    [w0, x, y] = generateModel(dim, n_samples);
    [weights] = GD(x, y, init_weights, learningRate, iterations);
    
    [performance_w0] = testModel(w0, x, y);
    [performance] = testModel(weights, x, y);
    
    if performance_w0 > performance
        win = win + 1;
    end
end


win

