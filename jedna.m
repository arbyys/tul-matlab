clear
close all
clc

q = 30; % q = skalár
w = [1, 3]; % pole
x = 1:5; % vektor (1 až 5)
w
x

z = [1,2,3; 4,5,6; 7,8,9]; % z = matice
zdva = [1,2,3; 4,5,6; 7,8,9]; % z = matice
z
z(1,2) = 99; % edit matice
z
z(1,:) = 99; % edit celeho prvního radku matice
z
z(end,:) = 99; % edit celeho posledniho radku matice
z
z(:) = 100; % edit všech prvků matice
z

w
w = w*3; % vynasobeni vsech prvku v promenne
w

z
% tečka před operátorem = po prvcích
% násobení po prvcích:
z.*zdva
% maticové násobení:
z*zdva


while q < 35
q
q = q+1
end

for p=0:3
p
end

if q == 30
    fprintf("30");
elseif q >= 30
    fprintf("vetsi nebo rovno 30\n");
else
    fprintf("else");
end
