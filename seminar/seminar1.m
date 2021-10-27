clear
close all
clc

1/0; % Inf
1/Inf; % 0
1/-0; % -Inf
1/+0; % Inf

x = 0:360;
y = cotd(x);
plot(x,y);
