
load('L2_success_rate_iterations_sqrtd.mat');

dimensions = {'20', '40', '80', '160', '320'};

%dimensions = {'160'};

xAxis = lower_limit:step_size:upper_limit;
figure % opens new figure window


for i = 1:5
    
    
    
    plot(xAxis,success_rate_cell{i});
    
    hold on;
    
end

title('Success rate of L2 (Using sqrt(d) for ||w_{init}||)')

l = legend(dimensions,'FontSize',8,'FontWeight','bold', 'Location','southeast');
%title(l,'dimension values')

xlabel('n/(dlog(d))')
ylabel('Success rate')

