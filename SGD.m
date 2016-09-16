function [ weights ] = SGD( X, y, weights, learningRate, iterations, B0, batch_size )
    %   Simple implementation of Stochastic Gradient Descent 
    
     % Getting the length of our dataset
    m = size(X); % size returns the dim of the matrix 
    n_samples = m(2); % number of columns
    
    
    if batch_size * 2 > n_samples
        weights = GD_v( X, y, weights, learningRate, iterations, B0);
        return
    end
    
    rest = mod(n_samples, batch_size);
    
    n_itr = (n_samples - rest) / batch_size;
    
    normalized_itr = floor(iterations / n_itr);
    
    for j = 1:normalized_itr
        
        % Shuffle X and y
        order = randperm(n_samples);
        X = X(:, order);
        y = y(order);
    
        % Run GD on the shuffled partitions
        for i = 1:batch_size:(batch_size*(n_itr - 1) + 1)
            weights = GD_v(X(:,i:i + batch_size - 1), y(i:i + batch_size - 1), weights, learningRate, 1, B0);
        end
        
        % If the partitions didn't divide the number of samples, do GD on
        % the las partition
        if rest ~= 0
            weights = GD_v(X(:,n_samples - rest + 1:n_samples), y(n_samples - rest + 1:n_samples), weights, learningRate, 1, B0);
        end
    
    end
    
end

