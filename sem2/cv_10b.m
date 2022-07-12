clear;
clc;
close all;

gps_tracking_data

format short;

d = @(a, b) sqrt((a(1) - b(1))^2 + (a(2) - b(2))^2 + (a(3) - b(3))^2);

F = @(x) [d(x,x1)-d1; 
          d(x,x2)-d2;
          d(x,x3)-d3
         ];
J = @(x) [(x-x1)'/d(x,x1);
          (x-x2)'/d(x,x2);
          (x-x3)'/d(x,x3)
         ];

[x, k] = newton_raphson(F, J, [1;1;1], 1e-7, 100)

function [x, k] = newton_raphson(f,J,x0,tol,maxit)
    %
    % Newton-Raphson method for solution of system of nonlinear equations.
    %
    % Input:
    % f ... multi-parametric function f(x), x being a column vector
    % J ... Jacobi matrix
    % x0 ... initial guess
    % tol ... residuum tolerance
    % maxit ... maximal number of iterations
    %
    % Output:
    % x ... found solution
    % k ... number iterations
    %

    k = 0;
    x = x0;
    res = norm(f(x));

    fprintf('   k     |gradL|\n');
    while (res > tol && k < maxit)
        k = k + 1;
        fx = f(x);
        r = J(x)\fx;
        x = x - r;
        res = norm(fx);
        fprintf('%4d %10g\n', k, res);
    end
end