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
vpa(subs(g, y, 3), 100) %p�evod symbolick� veli�iny na numerickou a 
                        %nahrazen� "y" ve funkci g hodnotou 3 s p�esnost�
                        %na 100 cifer.  
%5
vpa(int(g, y, 1, 2), 6) % vpa spo�te ur�it� integr�l od 1 do 2 
                        %funkce g(y) s p�esnost� na 6 desetin�ch m�st.
%obd�ln�kov� metoda - (v�po�et byl rychlej��, ale p�esnost byla jen na 4
%desetin� m�sta)
krok=0.000001; %definice velikosti kroku
rozdeleni=1:krok:2-krok; %doslova: "od jedn� po kroku do 2-krok"
sum((log(abs(cos(1./(rozdeleni+krok/2))))+exp(-1./(rozdeleni+krok/2).^2))*krok)
% suma(sou�et); do funkce na m�sto x dosad�me "rozd�len�+krok/2" a funkci
% vyn�sob�me krokem
%6
int(f,x,y) %z�pis neur�it�ho integr�lu je krat�� o horn� a doln� mez
%7
%symbolicky
syms k n
symsum((sin(((2*pi)/3)*(k))),1,n) %sym(symb.)-sum(sou�et)(fce,od 1,do n)
%numericky
sum((sin(((2*pi)/3)*(1:40)))) %sum = sou�et;((fce)-za k dosazeno
                              %(1:40)=od 1 do 40
                              % ans= 0.8660 a po dosaten� tohoto v�sledku
                              % do symbolick�ho(analitick�ho �e�en� vy�lo:
                              % ans= 0.8434
%8
z=limit(f,x,pi/2) %spo�te limitu funkce f jdouc� z x do pi/2
%9
int((diff(f,y)),x,0,+inf) %integr�l((derivace(fce f,podle y )),podle x,od
                          %0,do +nekone�na)
%10
syms a
A=[1 -3 a ;2 -6 9; -a 3 0];
solve(det(A))

syms a
syms x
A = [ 1 -3 a; 2 -6 9; -a 3 0] %z�pis pro line�rn� rovnici
solve(det(A)) %lze tak� �e�it: det(A) => roots([-6 33 -27])
A = subs(A, a, 1); % v matici A nahrad�me a jedni�kou
[V D] = eig(A); %vytv��� matice vlastn�ch hodnot ( D ) a charakteristick�ch
                %vektor� matice A (V), tak, �e A * V = V * D. Matice D je 
                %kanonick� forma matice A-diagon�ln� matice s vlastn�mi 
                %��sly matice A na hlavn� diagon�le. Matice V je mod�ln� 
                %matice-jej� sloupce jsou vlastn� vektory matice A.
p = det(A - x*eye(3)) %charakteristick� polynom
%11
expand(cos(3*x)-sin(3*x)) %p��kaz expand roz���� v�raz na v�echny podv�razy
%12
solve('exp(-x^2+4*x-9)=1')%analytick� �e�en� pomoc� p��kazu solve rovnici 
                          %mus�me ohrani�it uvozovkami, jinak by syntakse 
                          %ned�vala smysl.
roots([-1 4 -9]) % e^0=1 ;Numerick� �e�en�; p��kaz roots vrac� sloupcov� vektor jehoo� prvky
                 %jsou ko�eny polynomu(-x^2+4x-9)

                          