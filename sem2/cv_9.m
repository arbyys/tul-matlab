clear;
clc;
close all;

f1 = @(x) sin(x) ./ x;

f1_real_value = integral(f1, 0, 1);
n_array = [];
aprox_values = [];
errors = [];
for exp=1:7
    n_array = [n_array; 10^exp];
    computed = composite_midpoint(f1, 0, 1, 10^exp);
    aprox_values = [aprox_values; computed];
    errors = [errors; (f1_real_value - computed)];
end

table(n_array, aprox_values, errors)

%===========

f2 = @(x) 2*x + 1;
f3 = @(x) (1/2 + cos(x)) .* sin(x);

f2_real_value = integral(f2, -1, 1);
[f2_aprox_value, f2_k] = adapt_trapz(f2, -1, 1, 100, 1e-5);
f2_error = f2_real_value-f2_aprox_value;

table(f2_real_value, f2_aprox_value, f2_error)

f3_real_value = integral(f3, 0, 1);
[f3_aprox_value, f3_k] = adapt_trapz(f3, 0, 1, 100, 1e-5);
f3_error = f3_real_value-f3_aprox_value;

table(f3_real_value, f3_aprox_value, f3_error)

function [I,k] = adapt_trapz(f,a,b,maxlevel,tol)
    current = 0;
    k = 0;
    I = 0;
    while true
        array_temp = a:(b-a)/2^k:b;
        array = arrayfun(@(x) f(x), array_temp);
        array(2:end - 1) = array(2:end-1) * 2;
        I = (1/2*((b-a)/2^k))*sum(array);

        if ((k >= maxlevel) || (abs(I - current) < tol))
            return;
        end
        current = I;
        k = k+1;
    end
end

function I = composite_midpoint(f,a,b,n)
    result = 0;
    step = (b-a)/n;
    for i = 0:n-1
        result = result + f((a + step/2) + i*step);
    end
    I = result*step;
end