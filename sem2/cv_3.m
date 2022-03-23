clear; clc; close all;

A = full(gallery('poisson',5));
A2 = full(gallery('lehmer',20));
A3 = full(gallery('dorr',5));

[j1_x, j1_flag, j1_rr, j1_it, j1_rv] = jacobi(A, ones(25, 1), 1e-7, 1000);
[g1_x, g1_flag, g1_rr, g1_it, g1_rv] = pcg(A, ones(25, 1), 1e-7, 1000);
%[j2_x, j2_flag, j2_rr, j2_it, j2_rv] = jacobi(A2, ones(20, 1), 1e-7, 1000);
[j3_x, j3_flag, j3_rr, j3_it, j3_rv] = jacobi(A3, ones(5, 1), 1e-7, 1000);
semilogy(1:j1_it+1, j1_rv)

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
    rv = [rv; norm(b-A .* xtotal)];
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

function [x,flag,rr,it,rv] = gauss_seidel(A,b,tol,maxit)
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
        xtemp = xtemp + A(i, j) * xtotal(j);
      end
      xtemp2 = 0;
      for j = i+1:size(A, 1)
        xtemp2 = xtemp2 + A(i, j) * xcurr(j);
      end
      xtotal(i, 1) = (1/A(i,i)) * (b(i) - xtemp - xtemp2);
    end
    rv = [rv; norm(b-A .* xtotal)];
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