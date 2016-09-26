poolobj = parpool(4);

dim = 40;

w0_norm = 3;
learningRate = 1;

itr = 1000;

n_tests = 100; % number of tests per batch size



k = 0.5;

n_samples = floor(k * dim * log(dim));




[w0, B0, x, y] = generateModel(dim, n_samples, w0_norm);

init_weights = 1 / sqrt(sqrt(dim)) * randn(dim, 1);

t1 = GD_v(x, y, init_weights, learningRate, iterations, B0);

init_weights2 = 1 / sqrt(sqrt(dim)) * randn(dim, 1);

t2 = GD_v(x, y, init_weights2, learningRate, iterations, B0);

t1
t2

norm (t1 - t2)


delete(poolobj)