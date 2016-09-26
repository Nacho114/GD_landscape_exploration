
load('160_success_rate_iterations_sqrtsqrtd.mat');

%dimensions = {'20', '40', '80', '160', '320'};

dimensions = {'160'};

xAxis = lower_limit:step_size:upper_limit;
figure % opens new figure window


for i = 1:1
    
    
    
    plot(xAxis,success_rate_cell{i});
    
    hold on;
    
end

title('Success rate of Quadratic Cost (Using sqrt(d) for ||w_{init}||)')

l = legend(dimensions,'FontSize',8,'FontWeight','bold', 'Location','southeast');
%title(l,'dimension values')

xlabel('n/(dlog(d))')
ylabel('Success rate')

