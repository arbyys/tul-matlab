    clear;
clc;
close all;

% 1)
B = sym((12/63 + 21/51) * (7/5) - 22/7)

% 2)
syms x
syms y
fxy = log(abs(cos(x)))+ y*x*exp(-x^2)

% 3) 
g = subs(fxy, x, 1/y)

% 4)
sfg = vpa(subs(g, y, 3), 100)

% 5) 
I = vpaintegral(g, 1,2)

% 6)
NI = int(fxy,x) 

% 7) 
A = sum(sin(2*pi.*(1:40)./3))

% 8)
limit(fxy, x, pi/2)

% 9)
d = int(diff(fxy, y),x, [0, Inf])

% 10)
syms w v z
a = 1;

eq1 = w - 3*v + a*v == 1
eq2 = 2*w - 6*v + 9*z == 5
eq3 = -a*w + 3*v == 0

[M,N] = equationsToMatrix([eq1,eq2,eq3], [w,v,z])

p = charpoly(M)

solved = linsolve(M,N)

% 11)
syms q
c = cos(3*q)-sin(3*q)
expand(c)

% 12)
syms r
solve(exp(-r^2 + 4*r - 9) == 1)
roots([-1 4 -9])
