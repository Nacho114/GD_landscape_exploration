
dataFileLocation = '/home/aleman/GD_exploration/data/diverse/SGD_vs_GD_4k.mat';

load(dataFileLocation);


xAxis = [10, 100, 500, 1000, 4000];

figure % opens new figure window

plot(xAxis, error_list)



title('SGD convergance to GD (Sample size of 10^4)');



xlabel('batch size')
ylabel('Average error over 100 trials')

