
%fileName = '.m';
%load(fileName);


x = 0:pi/100:2*pi;
y = sin(x);

figure % opens new figure window
plot(x,y)

xlabel('inverse estimation error')
ylabel('n/d')