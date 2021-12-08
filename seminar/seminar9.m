clear
close all
clc

x = 0:0.01:7;
y = 0.5*x.^2;
z = zderivuj(x,y);

y = cos(x)
integralFunkce = zintegruj(x,y)
plot(x,integralFunkce)
%plot(x,z); %derivace graf

function out=zderivuj(x,y)
    for i = 1:length(x)-1
        delta = abs(x(i)-x(i+1));
        derivace = (y(i+1) - y(i)) / delta;
        temp(i) = derivace;
    end
    temp(length(x)) = temp(length(x)-1);
    out = temp;
end

function out=zintegruj(x,y)
    integrace(1) = 0;
    for i = 2:length(x)
        integrace(i) = integrace(i-1) + (0.5*(x(i)-x(i-1))*(y(i-1)+y(i)));
    end
    out = integrace;
end

function out=integral(x,y)
    integrace = 0;
    for i = 2:length(x)
        integrace = integrace + (0.5*(x(i)-x(i-1))*(y(i-1)+y(i)));
    end
    out = integrace;
end