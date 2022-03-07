clear
close all
clc

x = [2, 1, 3, 7, 4];
y = [2, 1, 2, 6, -3];

x2 = [1, 2, 3, 4];
y2 = [0, -1, 2, 2];

%a = Interpol(x,y);
a = Regrese(x2, y2, 1);

%xx = 0:0.1:8;
xx = 0:0.1:5;
yy = polynom(xx, a);

plot(xx, yy)
hold on
plot(x2, y2, "ro")


function a = Interpol(x, y)
    A = x'.^0;
    for i = 1:length(x)-1
        A = [x'.^i, A];
    end
    a = A\y';
end

function a = Regrese(x, y, s)
    A = x'.^0;
    for i = 1:s
        A = [x'.^i, A];
    end
    a = A\y';
end

function y = polynom(x, a)
    y = 0;
    stupen = length(a) - 1;
    for i = 0:stupen
        y = y + a(i+1) * x.^(stupen-i);
    end
end