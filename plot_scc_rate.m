
dataFileLocation = '/home/aleman/GD_exploration/data/iteratedResults/success_rate_iterations_CE.mat';

load(dataFileLocation);


xAxis = lower_limit:step_size:upper_limit;
dimensions_txt = {'20', '40', '80', '160', '320'};
figure % opens new figure window

index = 1;
for d = dimensions 
    
    plot(xAxis,success_rate_cell{index}');
    
    success_rate_cell{index}
    index = index + 1;
    hold on;
    
end

title('Cross Entropy Success Rate');

l = legend(dimensions_txt,'FontSize',8,'FontWeight','bold', 'Location','southeast');
%title(l,'dimension values', 8)

xlabel('n/(d logd')
ylabel('Succes Rate')

