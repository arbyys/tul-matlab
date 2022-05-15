clear;
clc;
close all;

M = [
    0 0.5 0.25 1 0.3333;
    0.3333 0 0.25 0 0;
    0.3333 0.5 0 0 0.3333;
    0.3333 0 0.25 0 0.3333;
    0 0 0.25 0 0;
];

[vec, lambda] = mocninna_metoda(M, [1; 1; 1; 1; 1], 1e-08, 1000);

[vecSorted, I] = sort(vec);
Y = ['A', 'B', 'C', 'D', 'E'];
webs = Y(I);

function [vec, lambda] = mocninna_metoda(A, y0, tol, maxit)
    vectorPrev = y0;
    lambdaPrev = -1;
    for it = 1:maxit
        vectorCurr = A * vectorPrev;
        [V,maxPos] = max(abs(vectorCurr));
        lambdaCurr = vectorCurr(maxPos) / vectorPrev(maxPos);
        if(abs(lambdaCurr-lambdaPrev) < tol)
            vec = vectorCurr / sum(vectorCurr);
            lambda = lambdaCurr;
            return
        end
        vectorPrev = vectorCurr;
        lambdaPrev = lambdaCurr;
    end
    vec = vectorCurr / sum(vectorCurr);
    lambda = lambdaCurr;
end