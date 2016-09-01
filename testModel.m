function [ performance ] = testModel( w0, x, y )
    % Function that returns the performance of an estimator for give w0

% default setting for sigmoid
    sigm_def = [1, 0];
    
    n_samples = length(y);
    y_guess = zeros(n_samples, 1);

    for i = 1:n_samples
        % Pr(Y = 1 | X= x) = sigmf(<x,w>)
        y_guess(i) = binornd(1, sigmf(dot(x(:,i), w0), sigm_def));

    end
    
    correct = 0;
    
    for j = 1:n_samples
        if y(j) == y_guess(j)
            correct = correct + 1;
        end
    end
   
    performance = correct / n_samples;
    
end