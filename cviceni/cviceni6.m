clear
close all
clc

xx = -30:0.1:30;
f1 = @(x) atan((x+1)./(x-1));
y1 = atan((xx+1)./(xx-1));
%plot(xx,y1)
y2 = xx./(sqrt(xx.^2-1));
f2 = @(x) x./(sqrt(x.^2-1));
%plot(xx,y2)
y3 = xx.^xx;
f3 = @(x) x.^x;
plot(xx,y3)

f1(9999999) % limita pro x->Inf
f1(-9999999) % limita pro x->-Inf
f1(1+eps) % limita pro x->1 zprava
f1(1-eps) % limita pro x->1 zleva

f2(9999999) % limita pro x->Inf
f2(-9999999) % limita pro x->-Inf
f2(1+eps) % limita pro x->1 zprava
f2(1-eps) % limita pro x->1 zleva

f3(9999999) % limita pro x->Inf
f3(-9999999) % limita pro x->-Inf
f3(1+eps) % limita pro x->1 zprava
f3(1-eps) % limita pro x->1 zleva

