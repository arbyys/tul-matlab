clear;
clc;
close all;
hold on;

xlim([-1.25 1.25]);
ylim([-1.25 1.25]);
ellipse_x = cos(linspace(0, pi*2));
ellipse_y = sin(linspace(0, pi*2)) * 0.5;
xline(0, '--');
yline(0, '--');

plot(ellipse_x, ellipse_y)

g = @(x) log(x + 0.5);

plot(-0.5:0.01:5, g(-0.5:0.01:5))

f = @(x) (x.^2) + (log(x + 0.5).^2 / 0.25) - 1;
fder = @(x) (2*x) + (2 * log(x + 0.5)) / (0.25 * (x + 0.5));

plot(-0.5:0.01:5, f(-0.5:0.01:5))

res1_1 = bisection(f, 0, 0.4, 1e-10, 1000);
res1_2 = newton(f, fder, 0, 1e-10, 1000);
res1_3 = newton_diff(f, 0, 0.4, 1e-10, 1000);

res1_average = (res1_1 + res1_2 + res1_3)/3;

res2_1 = bisection(f, 0.5, 1, 1e-10, 1000);
res2_2 = newton(f, fder, 0.5, 1e-10, 1000);
res2_3 = newton_diff(f, 0, 1, 1e-10, 1000);

res2_average = (res2_1 + res2_2 + res2_3)/3;

scatter(res1_average, f(res1_average));
scatter(res2_average, f(res2_average));
scatter(res1_average, g(res1_average));
scatter(res2_average, g(res2_average));

x1 = res1_average
x2 = res2_average
saveas(gcf, "graph.png");

function [x,res,k] = bisection(f,a,b,tol,maxit)
    k = 0;
    x = 0;
    while true
        x = (a + b) / 2;   
    
        if (f(x) * f(a) > 0)
            a = x;
        elseif (f(x) * f(b) > 0)
            b = x;
        end

        res = abs(f(x));

        if((k >= maxit-1) || (abs(res) < tol))
            return
        end

        k = k + 1;
    end
end

function [x,res,k] = newton(f,fp,x0,tol,maxit)
    k = 0;
    xprev = x0;
    
    while true
        x = xprev - (f(xprev) / fp(xprev));
        res = abs(xprev - x);
        xprev = x;

        if((k >= maxit-1) || (abs(res) < tol))
            return
        end

        k = k + 1;
    end
end

function [x, res, k] = newton_diff(f, x0, x1, tol, maxit)
    k = 2;
    storage = [x0, x1];
    
    while true
        x = storage(k) - f(storage(k)) * ( (storage(k) - storage(k-1)) / ( f(storage(k)) - f(storage(k-1))) );
        storage(end+1) = x;
        res = f(storage(k));
        
        if((k >= maxit-1) || (abs(res) < tol))
            return;
        end

        k = k + 1;
    end
end