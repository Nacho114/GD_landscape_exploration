weights = zeros(2, 1);
learningRate = 1;
x = [1, 3; 2, 4];
y = [1, 1]';

[weights, grad_w, grad_values] = GD_test(x, y, weights, learningRate);

grad_values


weights