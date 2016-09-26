

n_samples = 10;

batch_size = 3;

X = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
y = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]';

order = randperm(n_samples);
X = X(:, order);
y = y(order);

order

% Run GD on the shuffled partitions
for i = 1:batch_size:(batch_size*(n_itr - 1) + 1)
    X(:,i:i + batch_size - 1)
    y(i:i + batch_size - 1)
    
end

% If the partitions didn't divide the number of samples, do GD on
% the las partition
if rest ~= 0
    X(:,n_samples - rest + 1:n_samples)
    y(n_samples - rest + 1:n_samples)
end