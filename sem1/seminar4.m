clear
close all
clc

x = -2*pi:0.01:2*pi;
z = Taylor(x, [0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1]);
plot(x,z)

function y = Taylor(x,a)
    stupen = length(a) - 1;
    for i = 0:stupen
        b(stupen-i+1) = a(i+1)/factorial(i);
    end
    y = polynom(x,b);
end

function y = polynom(x, a)
    y = 0;
    stupen = length(a) - 1;
    for i = 0:stupen
        y = y + a(i+1) * x.^(stupen-i);
    end
end