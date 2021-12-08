clear
close all
clc

x = -1:0.01:1;
y = 0.5*x.^2;
z = zderivuj(x,y);

y = sqrt(1-x.^2);
integralFunkce = integral(x,y)
plot(x,z);

function out=zderivuj(x,y)
    for i = 1:length(x)-1
        delta = abs(x(i)-x(i+1));
        derivace = (y(i+1) - y(i)) / delta;
        temp(i) = derivace;
    end
    temp(length(x)) = temp(length(x)-1);
    out = temp;
end

function out=integral(x,y)
    integrace = 0;
    for i = 2:length(x)
        integrace = integrace + (0.5*(x(i)-x(i-1))*(y(i-1)+y(i)));
    end
    out = integrace;
end