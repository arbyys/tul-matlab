clear
close all
clc

% 1) Vygenerujte 3D pole C s náhodnými rozměry v rozsahu 10 - 40, ke generování
% rozměrů použijte příkaz rand, k zaokrouhlování floor, ceil, fix nebo round a ke
% generování prvků matice příkaz randn.

C = randn(floor(10 + (40 - 10) * rand(1,3)));

% 2) Spočítejte průměr všech prvků C s použitím
% a) cyklu for

soucet = 0;

for z = 1:size(C, 3)
    for y = 1:size(C, 2)
        for x = 1:size(C, 1)
            soucet = soucet + C(x,y,z);
        end
    end
end

prumerPresFor = soucet / numel(C)

% b) příkazu sum

prumerPresSUm = sum(C, 'all') / numel(C)

% 3) Převeďte pole C(1,:,:) na 2D matici pomocí příkazu squeeze a od každého řádku výsledné
% matice odečtěte jeho průměrnou hodnotu (jinými slovy odečtěte řádkové průměry – viz
% přednáška).

C = squeeze(C(1,:,:))
for x = 1:size(C, 1)
    C(x, :) = C(x, :) - sum(C(x, :), 'all') / numel(C(x, :));
end

% 4) Naprogramujte funkci, která z každého prvku x vstupní proměnné vrací hodnotu sin^2(x)cos(x)
% a tedy funguje stejně jako standardní funkce v Matlabu (tj. „po prvcích“).
% K naprogramování funkce nepoužívejte cyklů for nebo while. Optimální délka kódu jsou 2 řádky

vysledekFunkce = sincos(1:10)

function out = sincos(x)
    out = sin(x) .* sin(x) .* cos(x);
end
