function [ weights ] = GD( X, y, weights, learningRate, iterations, B0 )
    %   Simple implementation of Gradient Descent 

    % default setting for sigmoid
    sigm_def = [1, 0]; 
    
    % Getting the length of our dataset
    m = size(X); % size returns the dim of the matrix 
    n_samples = m(2); % number of columns
    n_weights = length(weights);
    
    
    % gradient vector 
    grad_w = zeros(n_weights, 1);
    
    % Note to self > 
    % Running gradient descent, think of vectorizing everything for
    % increased performance
    
    for itr = 1:iterations
   
        for j = 1:n_weights % we are looping over the Xi vectors here
            
            for i = 1:n_samples
                
                sig = sigmf(dot(weights, X(:, i)), sigm_def);
                sig_prime = sig * (1 - sig);            
                grad_w(j) = grad_w(j) + (y(i) - sig) * sig_prime * X(j, i);               
                
            end
            
            grad_w(j) = (-2 / n_samples) * grad_w(j);
          
         
        end
        
        weights = weights - learningRate * grad_w;
        
          
        % project points into B(0, B0) if the points fall outside
        if norm(weights) > B0         
            weights = (B0 / norm(weights)) * weights;
        end
              
        % reset the grad to zero
        grad_w = zeros(n_weights, 1); 
        
        
    end
    
end

