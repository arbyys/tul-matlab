clear
close all
clc

y = Newton(2, @funkce, 0.0001, 100 , 1e-6)

function out=Newton(x0, f, eps, maxiter, delta)
    i = 0;
    x = x0;
    while((abs(f(x)) > eps) && i < maxiter)
        x = x - (delta * f(x) / (f(x+delta) - f(x)));
        i = i+1;
    end
    if(i>=maxiter)
        out = NaN;
    end
    out = x;
end

function y=funkce(x)
    y = x^2+log10(x)-7;
end