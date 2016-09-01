

% parameters

n_samples = 20;
dim = 20;
w0_norm = 1;
learningRate = 1;
iterations = 1000;
trials = 10;

%init_weights = 1 / sqrt(sqrt(dim)) * randn(dim, 1);


s = sample_var( dim, n_samples, w0_norm, learningRate, iterations, trials );
s
