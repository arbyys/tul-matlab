clear; clc; close all;

A = full(gallery('poisson',5));
A2 = full(gallery('lehmer',20));
A3 = full(gallery('dorr',5));
b = ones(5, 1);
bsus = ones(20, 1);

%[x, flag, rr, it, rv] = jacobi(A, b, 1e-7, 1000);
[x, flag, rr, it, rv] = jacobi(A3, b, 1e-7, 1000);
x
flag
[x2, flag, rr, it, rv] = pcg(A3, b, 1e-7, 1000);
x2
flag
%[x, flag, rr, it, rv] = jacobi(A3, b, 1e-7, 1000);

function [x,flag,rr,it,rv] = jacobi(A,b,tol,maxit)
  x = NaN;
  xtotal = b;
  xcurr = b;
  rv(1,1) = norm(b-A.*xtotal);
  rr = norm(b-A.*xtotal) / norm(b);
  xtemp = 0;
  xtemp2 = 0;
 
  for iteration = 1:maxit
    it = iteration;
    for i = 1:size(A, 1)
      xtemp = 0;
      for j = 1:i-1
        xtemp = xtemp + A(i, j) * xcurr(j);
      end
      xtemp2 = 0;
      for j = i+1:size(A, 1)
        xtemp2 = xtemp2 + A(i, j) * xcurr(j);
      end
      xtotal(i, 1) = (1/A(i,i)) * (b(i) - xtemp - xtemp2);
    end
    rv(end+1) = norm(b-A .* xtotal);
    rr = norm(b-A .* xtotal) / norm(b);
    if(isnan(rr) || isinf(rr))
      flag = 4;
      return
    end
    if(rr < tol)
      flag = 0;
      return
    end
    if(iteration >= maxit)
      flag = 1;
      return
    end
    x = xtotal;
    xcurr = xtotal;
  end
end