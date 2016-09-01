

cd '/home/aleman/GD_exploration'

% default setting for sigmoid
sigm_def = [1, 0]; 



% parameters

n_samples = 10;
dim = 5;
w0_norm = 1;
learningRate = 1;
iterations = 1;

% initialize model 



n_tests = 100;
win = 0;

for i = 1:n_tests
    
    init_weights = 1 / sqrt(sqrt(dim)) * randn(dim, 1);
    [w0, B0, x, y] = generateModel(dim, n_samples, w0_norm);
    [weights] = GD(x, y, init_weights, learningRate, iterations, B0);
    
    [performance_w0] = testModel(w0, x, y);
    [performance] = testModel(weights, x, y);
    
    if performance_w0 > performance
        win = win + 1;
    end
end


% write to file

fileID = fopen('output_test.txt','w+');
%fprintf(fileID,'%6s %12s\n','Hello World','pls');
fprintf(fileID,'true performance win ratio vs estimate: %f / %f\n',win, n_tests);
fclose(fileID);