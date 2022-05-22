clear;
clc;
close all;

file = load("data/data0.mat", '-ascii');
xIn = file(:,1).';
yIn = file(:,2).';
xqIn = min(xIn)-1:0.1:max(xIn);
res = lagrange(xIn, yIn, xqIn);

plot(xqIn, res, xqIn, interp1(xIn,yIn,xqIn,'linear'), xqIn, interp1(xIn,yIn,xqIn,'spline'), xqIn, interp1(xIn,yIn,xqIn,'pchip'), xqIn, interp1(xIn,yIn,xqIn,'makima'));
xlabel('x') 
ylabel('f(x)y') 
legend({'lagrange', 'linear', 'spline', 'pchip', 'makima' },'Location','southeast')
saveas(gcf,'graph_data0.png');

%

file = load("data/data1.mat", '-ascii');
xIn = file(:,1).';
yIn = file(:,2).';
xqIn = min(xIn)-1:0.1:max(xIn);
res = lagrange(xIn, yIn, xqIn);

plot(xqIn, res, xqIn, interp1(xIn,yIn,xqIn,'linear'), xqIn, interp1(xIn,yIn,xqIn,'spline'), xqIn, interp1(xIn,yIn,xqIn,'pchip'), xqIn, interp1(xIn,yIn,xqIn,'makima'));
xlabel('x') 
ylabel('f(x)y') 
legend({'lagrange', 'linear', 'spline', 'pchip', 'makima' },'Location','southeast')
saveas(gcf,'graph_data1.png');

%

file = load("data/data2.mat", '-ascii');
xIn = file(:,1).';
yIn = file(:,2).';
xqIn = min(xIn)-1:0.1:max(xIn);

plot(xqIn, interp1(xIn,yIn,xqIn,'linear'), xqIn, interp1(xIn,yIn,xqIn,'spline'), xqIn, interp1(xIn,yIn,xqIn,'pchip'), xqIn, interp1(xIn,yIn,xqIn,'makima'));
xlabel('x') 
ylabel('f(x)y') 
legend({'linear', 'spline', 'pchip', 'makima' },'Location','southeast')
saveas(gcf,'graph_data2.png');

%

file = load("data/data3.mat", '-ascii');
xIn = file(:,1).';
yIn = file(:,2).';
xqIn = min(xIn)-1:0.1:max(xIn);

plot( xqIn, interp1(xIn,yIn,xqIn,'linear'), xqIn, interp1(xIn,yIn,xqIn,'spline'), xqIn, interp1(xIn,yIn,xqIn,'pchip'), xqIn, interp1(xIn,yIn,xqIn,'makima'));
xlabel('x') 
ylabel('f(x)y') 
legend({'linear', 'spline', 'pchip', 'makima' },'Location','southeast')
saveas(gcf,'graph_data3.png');

function yq = lagrange(x,y,xq)
    yq = [];
    for it = xq
        value = 0;
        for i = 1:size(x, 2)
            currentX = x;
            removed = currentX(i);
            currentX(i) = [];
            numerator = 1;
            denominator = 1;
            for current = 1:size(currentX, 2)
                numerator = numerator * (it - currentX(current));
                denominator = denominator * (removed - currentX(current));
            end
            value = value + (((y(i) * numerator)/denominator));
        end
        yq(end+1) = value;
    end
end