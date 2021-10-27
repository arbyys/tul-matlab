clear
close all
clc

% 1) Vygenerujte vektor a přirozených čísel od 1 do 50.
a = 1:50

% 2) Vygenerujte vektor b, který bude obsahovat racionální čísla od 1 do 10 s krokem 0.2.
b = 1:0.2:10

% 3) Vygenerujte matici A o rozměrech 3x3, která bude obsahovat samé jednotky, nulovou matici B stejných rozměrů a jednotkovou matici D stejných rozměrů.
A = ones(3)
B = zeros(3)
D = eye(3)

% 4) Spojte matice A, B a D do matice M o rozměrech 3x9.
M = [A, B, D]

% 5) Deklarujte matici C tak, aby měla následující prvky:
C = [1, -1, 1; 1, -1, 0; -1, 0, 1]

% 6) Spočtěte inverzní matici matice C a výsledek uložte do matice B1.
B1 = inv(C)

% 7) Vynásobte matice C a B1 maticově:
C * B1
% 7) Vynásobte matice C a B1 po prvcích:
C .* B1

% 8) Vynásobte (maticově) matice M a C příslušně transponované tak, aby součin existoval, pokud to vůbec jde.
% nedefinované

% 9) Přepište druhý sloupec C náhodnými hodnotami.
C(:,1) = rand(1,3)

% 10) Přepište první řádek C vlastními vymyšlenými hodnotami.
C(:,1) = [987, 567, 123]

% 11) Z matice C vyberte submatici C1, která bude obsahovat prvky prvního řádku z posledních dvou sloupců.
C1 = C(1, end-1:end)

% 12) Prvkům matice C, které jsou větší nebo rovny nule přiřaďte hodnotu 1. Prvkům, které jsou menší než nula přiřaďte náhodné hodnoty.
C(C >= 0) = 1
C(C < 0) = rand
