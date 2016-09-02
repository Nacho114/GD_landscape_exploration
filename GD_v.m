function [ weights ] = GD_v( X, y, weights, learningRate, iterations, B0 )
    %   Vectorized implementation of Gradient Descent 

    % default setting for sigmoid
    sigm_def = [1, 0]; 

    n_samples = length(y);
    
    for itr = 1:iterations
   
        sig = sigmf(X' * weights, sigm_def);
        % sig_prime = sig .* (1 - sig);
        
        grad_w =  (-2 / n_samples) * X * ( (y - sig) .* ( sig .* (1 - sig )) );
        
        weights = weights - learningRate * grad_w;
        
          
        % project points into B(0, B0) if the points fall outside
        if norm(weights) > B0         
            weights = (B0 / norm(weights)) * weights;
        end
        
    end
    
end

