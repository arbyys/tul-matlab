clear
close all
clc

input = -3:0.1:3;
p = polynom(input, [1, 0, -5, 0, 4]);

plot(input, p)

function y = polynom(x, a)
    y = 0;
    stupen = length(a) - 1;
    for i = 0:stupen
        y = y + a(i+1) * x.^(stupen-i);
    end
end
