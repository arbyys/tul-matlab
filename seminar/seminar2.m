clear
close all
clc

r = -360:360;
s = sind(r);

%plot(r, s)

x = -5:0.1:5;
y = sqrt(25 - x .^ 2)

%plot(x,y);

fi = 0:0.01:2*pi;

ro = fi ./ fi * 5;
polar(fi,ro)
