
dataFileLocation = '/home/aleman/GD_exploration/iteratedResults/CE_estimation_error_cell';
origFileName = 'estimation_error_cell';
extension = '.mat';


xAxis = lower_limit:step_size:upper_limit;
functions_txt = {'STD', 'CE'};
figure % opens new figure window
dimensions = [1];
index = 1;
for d = dimensions 
    
    plot(xAxis,estimation_error_cell{index}');
    index = index + 1;
    
    hold on;
    
end

title('Cross Entropy Estimation Error');

l = legend(functions_txt,'FontSize',8,'FontWeight','bold', 'Location','southeast');
%title(l,'dimension values', 8)

xlabel('n/d')
ylabel('1 / (Estimation error')

