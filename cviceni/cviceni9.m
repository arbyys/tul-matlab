clc;
clear all;
close all;


% 1)
x = -10:00.1:10;
y = (sin(x))./(x) + exp(-(x-4).^2);
plot(x,y)

fun = @(x)(sin(x))/(x) + exp(-(x-4)^2);
fminbnd(fun, 2, 4)
fminbnd(fun, 4, 6)

% 2)
f1 = @(x) (1/4.*x.^4) - (41/6.*x.^3) + (209/4.*x.^2) - 135.*x
fminbnd(f1, -999999, 999999)

% 3) 

x1 = -2:0.01:2;
x2 =  -2:0.01:2;
[x1,x2] = meshgrid(x1,x2);
y2 =  100.*(x2 - x1.^2).^2 + (1 - x1).^2;
% surf(x1, x2, y2)

fun = @(x)100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
x0 = [-1.2,1];
fminsearch(fun,x0)

% 4)

ff = [-5,-2,-6];
A = [
    1 -1 1
    3 2 4
    3 2 0
    ];

b =  [ 20 42 30 ];

lb = [0 0 0];

linprog(ff, A, b, [], [], lb, [])

% 5)
syms xx1 xx2 xx3 yy
f3 = 4*xx1^2 + 2*xx2^2 + 3*xx3^2 + 2*xx1*xx2 - 3*xx2*xx3 - xx1;
H = double(hessian(f3));

ff3 = [ -1 0 0 ];

A = [
    1 -1 1
    1 2 -6
    ];

b =  [ -1 5 ];

lb = [0 0 0];

quadprog(H, ff3, A, b, [], [], lb)