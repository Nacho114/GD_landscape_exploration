
dataFile = '/home/aleman/GD_exploration/data/success_rate_d=';
extension = '.mat';
dimensions = {'20', '40', '80'};

step_size = 0.5;
lower_limit = 0.5;
upper_limit = 3.5;

xAxis = lower_limit:step_size:upper_limit;
figure % opens new figure window


for d = dimensions
    fileName = strcat(dataFile, d{1});
    fileName = strcat(fileName, extension);
    fileName
    load(fileName);
    
    
    plot(xAxis,success_rate_values);
    
    hold on;
    
end

title('Success Rate');

l = legend(dimensions,'FontSize',8,'FontWeight','bold', 'Location','southeast');
%title(l,'dimension values', 8)

xlabel('n/(dlog(d))')
ylabel('Success rate')

