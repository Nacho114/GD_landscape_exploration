function [ w0, B0, x, y ] = generateModel( dim, n_samples, w0_norm )
    % Function that returns the model as per the Montanari papaer
    % x is iid from std normal
    % y is calculated through the following conditioning
    % Pr(Y = 1 | X= x) = sigmf(<x,w>)
    % w0 is a random vector iid in std normal, it is not excplicity written
    % in the paper how w0 is generated.
   
    % default setting for sigmoid
    sigm_def = [1, 0];

    % generate random w0 and normalize accordingly
    w0 = randn(dim, 1);
    w0 = (w0_norm / norm(w0)) * w0;
    
    % generate radius of Ball
    B0 = 2 * w0_norm;
    
    x = randn(dim, n_samples);

    y = zeros(n_samples, 1);

    for i = 1:n_samples
        % Pr(Y = 1 | X= x) = sigmf(<x,w>)
        y(i) = binornd(1, sigmf(dot(x(:,i), w0), sigm_def));

    end

end