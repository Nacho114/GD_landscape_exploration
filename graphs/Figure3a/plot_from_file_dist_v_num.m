
load('CE_distance_vs_number_of_iterations.mat');

dimensions = {'10', '20', '40', '80', '160'};



xAxis = lower_limit:step_size:upper_limit;
figure % opens new figure window


for i = 1:5
    
    
    
    semilogy(xAxis,dist_vs_num_itr_cell{i});
    
    hold on;
    
end

title('Cross Entropy convergence speed')

l = legend(dimensions,'FontSize',8,'FontWeight','bold', 'Location','southeast');
%title(l,'dimension values')

xlabel('number of iterations')
ylabel('||Wn(k) - West||2')

