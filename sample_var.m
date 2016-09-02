function [ S_YX ] = sample_var( dim, n_samples, w0_norm, learningRate, iterations, trials )
    % In fact this corresponds to the covariance matrix, not clear
    % definition used in the paper.
    
    [w0, B0, x, y] = generateModel(dim, n_samples, w0_norm);
    
    w_estimates = zeros(dim, trials);
    
    for i = 1:trials
        init_weights = 1 / sqrt(sqrt(dim)) * randn(dim, 1);
        w_estimates(:,i) = GD_v(x, y, init_weights, learningRate, iterations, B0);
        
    end
    
    S_YX = sqrt(sum(var(w_estimates, 0, 2))); 
    
    % var(w_estimates, 0, 2) is equivalent to a vector containing the
    % diagonal values of the covariance matrix, i.e. the variances of each
    % component, (0, 2) parameters indicate that there are no special
    % weights (0), and the variance is taken across columns (2).
   
end
    