% pozice satelitu
x1 = [20180; 21800; 24600];
x2 = [25300; 21400; 23000];
x3 = [22200; 20200; 22600];

% vzdalenost satelitu
d1 = 3.853416925275540e+04;
d2 = 4.030272199244115e+04;
d3 = 3.753709365414429e+04;

f = @(x) []

function res = calculate_width(x1, x2)
    res = sqrt((a(1) - b(1))^2 + (a(2) - b(2))^2 + (a(3) + b(3))^2)
end

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