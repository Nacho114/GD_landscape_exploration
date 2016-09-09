function [ weights ] = GD_CE_v( X, y, weights, learningRate, iterations, B0 )
    %   Vectorized implementation of Gradient Descent for the cross-entropy
    %   function

    % default setting for sigmoid
    sigm_def = [1, 0]; 

    n_samples = length(y);
    
    for itr = 1:iterations
   
        sig = sigmf(X' * weights, sigm_def);
        % sig_prime = sig .* (1 - sig);
        
        grad_w = (1 / n_samples) * ( X * (sig - y) );
        
        weights = weights - learningRate * grad_w;
        
          
        % project points into B(0, B0) if the points fall outside
        if norm(weights) > B0         
            weights = (B0 / norm(weights)) * weights;
        end
        
    end
    
end

