function [ inv_est_err ] = estimation_error( w_estimates, w0 )
    % Function that computes the inverse of the estimated error
    % where W_est and W0 are lists of estimate / true value vectors

    inv_est_err = 0;
    n = length(w_estimates);

    for i = 1:n
        inv_est_err = inv_est_err + norm(w_estimates{i} - w0); % 2-norm
    end
    
    inv_est_err = inv_est_err / n;

end
