function [ weights ] = SGD( X, y, weights, learningRate, iterations, B0, batch_size )
    %   Simple implementation of Stochastic Gradient Descent 
    %   Note that data is not shuffled since it is assumed as random.
    
     % Getting the length of our dataset
    m = size(X); % size returns the dim of the matrix 
    n_samples = m(2); % number of columns
    
    rest = mod(n_samples, batch_size);
    
    
    for i = 1:batch_size:n_samples
        weights = GD(X(:,i:i + batch_size - 1), y(i:i + batch_size - 1), weights, learningRate, iterations, B0);
    end

    if rest ~= 0
        weights = GD(X(:,i:i + batch_size - 1), y(i:i + batch_size - 1), weights, learningRate, iterations, B0);
    end
    
    
end

