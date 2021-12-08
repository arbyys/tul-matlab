clear all
close all
clc

syms x
syms y

%1
sym(((12/63)+(21/51))*(7/5)-(22/7))
%2
f=funkce42(x,y)
%3
g=subs(f,x,1/y); % nahrazuju "x" z funkce "f" hodnotou "1/y"
%4
vpa(subs(g, y, 3), 100) %pøevod symbolické velièiny na numerickou a 
                        %nahrazení "y" ve funkci g hodnotou 3 s pøesností
                        %na 100 cifer.  
%5
vpa(int(g, y, 1, 2), 6) % vpa spoète urèitý integrál od 1 do 2 
                        %funkce g(y) s pøesností na 6 desetiných míst.
%obdélníková metoda - (výpoèet byl rychlejší, ale pøesnost byla jen na 4
%desetiná místa)
krok=0.000001; %definice velikosti kroku
rozdeleni=1:krok:2-krok; %doslova: "od jedné po kroku do 2-krok"
sum((log(abs(cos(1./(rozdeleni+krok/2))))+exp(-1./(rozdeleni+krok/2).^2))*krok)
% suma(souèet); do funkce na místo x dosadíme "rozdìlení+krok/2" a funkci
% vynásobíme krokem
%6
int(f,x,y) %zápis neurèitého integrálu je kratší o horní a dolní mez
%7
%symbolicky
syms k n
symsum((sin(((2*pi)/3)*(k))),1,n) %sym(symb.)-sum(souèet)(fce,od 1,do n)
%numericky
sum((sin(((2*pi)/3)*(1:40)))) %sum = souèet;((fce)-za k dosazeno
                              %(1:40)=od 1 do 40
                              % ans= 0.8660 a po dosatení tohoto výsledku
                              % do symbolického(analitického øešení vyšlo:
                              % ans= 0.8434
%8
z=limit(f,x,pi/2) %spoète limitu funkce f jdoucí z x do pi/2
%9
int((diff(f,y)),x,0,+inf) %integrál((derivace(fce f,podle y )),podle x,od
                          %0,do +nekoneèna)
%10
syms a
A=[1 -3 a ;2 -6 9; -a 3 0];
solve(det(A))

syms a
syms x
A = [ 1 -3 a; 2 -6 9; -a 3 0] %zápis pro lineární rovnici
solve(det(A)) %lze také øešit: det(A) => roots([-6 33 -27])
A = subs(A, a, 1); % v matici A nahradíme a jednièkou
[V D] = eig(A); %vytváøí matice vlastních hodnot ( D ) a charakteristických
                %vektorù matice A (V), tak, že A * V = V * D. Matice D je 
                %kanonická forma matice A-diagonální matice s vlastními 
                %èísly matice A na hlavní diagonále. Matice V je modální 
                %matice-její sloupce jsou vlastní vektory matice A.
p = det(A - x*eye(3)) %charakteristický polynom
%11
expand(cos(3*x)-sin(3*x)) %pøíkaz expand rozšíøí výraz na všechny podvýrazy
%12
solve('exp(-x^2+4*x-9)=1')%analytické øešení pomocí pøíkazu solve rovnici 
                          %musíme ohranièit uvozovkami, jinak by syntakse 
                          %nedávala smysl.
roots([-1 4 -9]) % e^0=1 ;Numerické øešení; pøíkaz roots vrací sloupcový vektor jehoož prvky
                 %jsou koøeny polynomu(-x^2+4x-9)

                          