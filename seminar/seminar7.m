clear
close all
clc

format long;

global i
i = 0;

y = pulint(0.1, 10000, @funkce, 0.0001)
i

function out=pulint(a,b,f,eps)
    global i
    if((eps <= 0) | (f(a) * f(b) > 0))
        out = NaN;
        return;
    end
    while(abs(a-b) >= eps)
        S = (a+b)/2;
        if((f(a) * f(S)) > 0)
            a = S;
            continue;
        elseif(f(a) * f(S) == 0)
            out = f(S)
            return;
        end
        b = S;
        i = i + 1;
    end
    out = (a+b)/2;
end

function y=funkce(x)
    y = x^2+log10(x)-7;
end