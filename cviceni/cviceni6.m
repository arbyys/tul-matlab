clear
close all
clc

xx = -10:0.1:10;
f = @(x) atan((x+1)./(x-1));
y = atan((xx+1)./(xx-1));
%plot(xx,y)
y2 = xx./(sqrt(xx.^2-1));
%plot(xx,y2)
y3 = xx.^xx;
plot(xx,y3)

f(999999) % limita pro x->Inf
f(-9999999) % limita pro x->-Inf
f(1+eps) % limita pro x->1 zleva
f(1-eps) % limita pro x->1 zprava

