function [ weights, grad_w, grad_values ] = GD_test( x, y, weights, learningRate )
    %   Simple implementation of Gradient Descent 

    % default setting for sigmoid
    sigm_def = [1, 0]; 
    
    % Getting the length of our dataset
    tmp = size(x);
    n_samples = tmp(2);
    n_weights = length(weights);
    disp(n_samples);
    disp(n_weights);
    
    % Vector for new weights
    grad_w = zeros(n_weights, 1); 
    grad_values = zeros(n_weights, n_samples);
    
    for j = 1:n_weights % we are looping over the Xi vectors here
        
        for i = 1:n_samples

            sig = sigmf(dot(weights, x(:,i)), sigm_def);
            sig_prime = sig * (1 - sig);
            
            grad_values(j, i) = (-2 / n_samples) * (y(i) - sig) * sig_prime * x(j, i);
            grad_w(j) = grad_w(j) + (y(i) - sig) * sig_prime * x(j, i);
            
            
            %fprintf('j=%i, i=%i, grad = %f\n', j, i, grad_values(j, i));
        end
        
        grad_w(j) = (-2 / n_samples) * grad_w(j);
        
    end
    
  
    weights = weights - learningRate * grad_w;
                
    
end

