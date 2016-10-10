
load('CE_success_rate_iterations_sqrtd_lower_bounds.mat');

dim = {'20', '40', '80', '160', '320'};

%dimensions = {'160'};

xAxis = lower_limit:step_size:upper_limit;
figure % opens new figure window


for i = 1:5
    
    d = dimensions(i);
    
    plot((d * log(d) / sqrt(d))*xAxis,success_rate_cell{i});
    
    hold on;
    
end

title('Success rate of CE (Using sqrt(d) for ||w_{init}||)')

l = legend(dim,'FontSize',8,'FontWeight','bold', 'Location','southeast');
%title(l,'dimension values')

xlabel('n/sqrt(d)')
ylabel('Success rate')

