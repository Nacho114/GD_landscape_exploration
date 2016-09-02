
dim = 20;
w0_norm = 1;
n_samples = 100;

[w0, B0, x, y] = generateModel(dim, n_samples, w0_norm);
init_weights = 1 / sqrt(sqrt(dim)) * randn(dim, 1);
learningRate = 1;
iterations = 1;
 
 
gd = GD(x, y, init_weights, learningRate, iterations, B0)

gd_v = GD_v(x, y, init_weights, learningRate, iterations, B0)

sum( (gd - gd_v) > 0.0000001)