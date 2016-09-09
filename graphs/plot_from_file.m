
load('success_rate_iterations_CE.mat');


dataFile = '/home/aleman/GD_exploration/data/success_rate_d=';
extension = '.mat';
dimensions = {'20', '40', '80', '160', '320'};

%step_size = 0.5;
%lower_limit = 0.5;
%upper_limit = 3.5;

xAxis = lower_limit:step_size:upper_limit;
figure % opens new figure window


for i = 1:5
    
    
    
    plot(xAxis,success_rate_cell{i});
    
    hold on;
    
end

title('Success rate of Cross-Entropy')

l = legend(dimensions,'FontSize',8,'FontWeight','bold', 'Location','southeast');
%title(l,'dimension values')

xlabel('n/(dlog(d))')
ylabel('Success rate')

