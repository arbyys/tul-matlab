clc;
clear all;
close all;


% 1)


krok=0.01;
syms x

rozdeleni = 0:krok:2*pi-krok;
I1 = sum(1./(2+cos(rozdeleni+krok/2))*krok)
sI1 = vpa(int(1/(2 + cos(x)),x,0,2*pi))

rozdeleni = 0:krok:sqrt(3)-krok;
I2 = sum((rozdeleni+krok/2).*atan(rozdeleni+krok/2)*krok)
sI2 = vpa(int(x*atan(x),x,0,sqrt(3)))

rozdeleni = 0:krok:2*pi-krok;
I3 = sum(sqrt(1-sin(2.*(rozdeleni+krok/2)))*krok)
sI3 = vpa(int(sqrt(1-sin(2*x)),0,2*pi))

rozdeleni = -10:krok:5-krok;
I4  = sum(exp(-(rozdeleni+krok/2).^2)*krok)
sI4 = vpa(int(exp(-(x)^2),x,-10,5))

rozdeleni = -99999:krok:99999;
I5  = sum(exp(-(rozdeleni+krok/2).^2)*krok)
sI5 = vpa(int(exp(-(x)^2),x, -Inf, Inf))

% 2) 

% analyticky
x=1:1:9999;

f1 = (((-1).^x)./(2.^(x-1)));
s1 = sum(f1)

f2 = 1./(x.*(x+1));
s2 = sum(f2)

f3 = (((-1).^x)./(x));
s3 = sum(f3)

f4 = ((2.*x) - 1)./(2.^x);
s4 = sum(f4)

% symbolicky
syms n
ss1 = vpa(symsum(((-1)^n)*(1/(2^(n - 1))),n,1,Inf))

ss2 = vpa(symsum(1/(n*(n + 1)), n, 1, Inf))

ss3 = vpa(symsum(((-1)^n)/n, n, 1, Inf))

ss4 = vpa(symsum((2*n - 1)/2^n , n, 1, Inf))

% 3) 

rozsah = -10:1:10;

syms a
M1 = [1,a.^2,0; 7,3,5; a,1-a,6]
M2 = [a,1,3; 8,(1-a).^2,-1; -3.*a,a,4]

MD1 = det(M1)
MD2 = det(M2)

MDD1 = diff(MD1)
MDD2 = diff(MD2)

roots = vpa(solve(MDD1))
roots2 = vpa(solve(MDD2))

MDD12 = diff(MDD1)
MDD22 = diff(MDD2)