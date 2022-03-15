clear; clc; close all;

A = [2 4; 1 2];
b = [1; 1; 1];
[x, U] = gauss_elim(A, b)

function [x, U] = gauss_elim(A,b)
    s = size(A, 2);
    % <gaussova eliminace>

    for colIndex = 1:s
        % <pivotace>
        max = 0;
        pivotRowNumber = -1;
        for rowIndex = colIndex:s % nalezení pivota
            if(abs(A(rowIndex, colIndex)) > max)
                max = A(rowIndex, colIndex);
                pivotRowNumber = rowIndex;
            end
        end
        if(max <= 1e-15)
            error('singular');
        end
        if(pivotRowNumber ~= colIndex)
            A([colIndex pivotRowNumber],:)=A([pivotRowNumber colIndex],:); % prohození řádků u matice
            b([colIndex pivotRowNumber]) = b([pivotRowNumber colIndex]);
        end
        % </pivotace>
        
        % <vynulování sloupce>
        for rowIndex = colIndex+1:s
            pivot = A(colIndex, colIndex);
            currentRow = A(colIndex,:);
            currentNum = A(rowIndex, colIndex);
            A(rowIndex,:) = A(rowIndex,:) - (currentRow .* (currentNum / pivot));
            b(rowIndex) = b(rowIndex) - (b(colIndex) .* (currentNum / pivot));
        end
        % </vynulování sloupce>
    end

    % </gaussova eliminace>

    U = A; % vrácení matice v HST

    % <jordanova eliminace>

    for colIndex = s:-1:1
        % <vynulování sloupce>
        for rowIndex = colIndex-1:-1:1
            pivot = A(colIndex, colIndex);
            currentRow = A(colIndex,:);
            currentNum = A(rowIndex, colIndex);
            A(rowIndex,:) = A(rowIndex,:) - (currentRow .* (currentNum / pivot));
            b(rowIndex) = b(rowIndex) - (b(colIndex) .* (currentNum / pivot));
        end
        % </vynulování sloupce>
    end

    % </jordanova eliminace>

    % <vydělení všech řádků číslem na diagonále>
    for i=1:size(b,1)
        b(i) = b(i) / A(i,i);
    end
    % </vydělení všech řádků číslem na diagonále>
    
    x = b; % vrácení vektoru řešení
end