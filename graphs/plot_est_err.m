
dataFileLocation = '/home/aleman/GD_exploration/data/iteratedResults/L2_estimation_error_iterations.mat';

load(dataFileLocation);


xAxis = lower_limit:step_size:upper_limit;
dimensions_txt = {'5', '10', '20', '40', '80'};
figure % opens new figure window

index = 1;
for d = dimensions 
    
    plot(xAxis,estimation_error_cell{index}');
    index = index + 1;
    
    hold on;
    
end

title('Quadratic cost with L2 Estimation Error');

l = legend(dimensions_txt,'FontSize',8,'FontWeight','bold', 'Location','southeast');
%title(l,'dimension values', 8)

xlabel('n/d')
ylabel('1 / (Estimation error')

