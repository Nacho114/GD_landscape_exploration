function [ error_estimate ] = CE_sample_estimation_error( dim, n_samples, w0_norm, learningRate, iterations, trials )
    % Returns the empirical inverse of the estimation error, where trials
    % is the number of samples taken, where each sample is generated
    % through a different weight initialization.

    [w0, B0, x, y] = generateModel(dim, n_samples, w0_norm);

    w_estimates = cell(trials, 1);


    parfor i = 1:trials
        init_weights = 1 / sqrt(sqrt(dim)) * randn(dim, 1);
        [w_est] = GD_CE_v(x, y, init_weights, learningRate, iterations, B0);
        w_estimates{i} = w_est;
    end

    error_estimate = 1 / estimation_error(w_estimates, w0);



end
