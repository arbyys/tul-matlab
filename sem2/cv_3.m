clear;
clc;
close all;

A = full(gallery('poisson',5));
b=ones(25,1);
[x,flag,rr,it,rv]=pcg(A,b,1e-7,1000);
[x2,flag2,rr2,it2,rv2]=jacobi(A,b,1e-7,1000);
[x3,flag3,rr3,it3,rv3]=gauss_seidel(A,b,1e-7,1000);

iter=1:1001;
rv(numel(iter))=0;
rv2(numel(iter))=0;
rv3(numel(iter))=0;

semilogy(iter,rv, iter,rv2, iter,rv3);

grid on;
legend('pcg()', 'jacobi()', 'gauss_seidel()');
title('poisson');
ylabel('rv');
xlabel('it');
saveas(gcf,'graph_poisson.png');

clear;
A = full(gallery('lehmer',20));
b=ones(20,1);
[x,flag,rr,it,rv]=pcg(A,b,1e-7,1000);
% metoda jacobi diverguje
[x3,flag3,rr3,it3,rv3]=gauss_seidel(A,b,1e-7,1000);

iter=1:1001;
rv(numel(iter))=0;
rv3(numel(iter))=0;

figure;
semilogy(iter,rv, iter,rv3);
grid on;
legend('pcg()', 'gauss_seidel()');
title('lehmer');
ylabel('rv');
xlabel('it');
saveas(gcf,'graph_lehmer.png');

clear;
A = full(gallery('dorr',5));
b=ones(5,1);
% metoda pcg diverguje
[x2,flag2,rr2,it2,rv2]=jacobi(A,b,1e-7,1000);
[x3,flag3,rr3,it3,rv3]=gauss_seidel(A,b,1e-7,1000);
iter=1:1001;
rv2(numel(iter))=0;
rv3(numel(iter))=0;

figure;
semilogy(iter,rv2, iter,rv3);
grid on;
legend('jacobi()', 'gauss_seidel()');
title('dorr');
ylabel('rv');
xlabel('it');
saveas(gcf,'graph_dorr.png');

function [x,flag,rr,it,rv] = jacobi(A,b,tol,maxit)
  x = NaN;
  xcurr = b;  
  xtotal = b;
  rv(1,1) = norm(b-A*xtotal);
  rr = norm(b-A*xtotal) / norm(b);
 
  for it = 1:maxit
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
    rv = [rv; norm(b-A * xtotal)];
    rr = norm(b-A * xcurr) / norm(b);
    if(isnan(rr) || isinf(rr))
      flag = 4;
      x = xcurr;
      return
    end
    if(rr < tol)
      flag = 0;
      x = xcurr;
      return
    end
    if(it == maxit)
      flag = 1;
      x = xcurr;
      return
    end
    xcurr = xtotal;
  end
end

function [x,flag,rr,it,rv] = gauss_seidel(A,b,tol,maxit)
  x = NaN;
  xcurr = b;  
  xtotal = b;
  rv(1,1) = norm(b-A*xtotal);
  rr = norm(b-A*xtotal) / norm(b);
 
  for it = 1:maxit
    for i = 1:size(A, 1)
      xtemp = 0;
      for j = 1:i-1
        xtemp = xtemp + A(i, j) * xtotal(j);
      end
      xtemp2 = 0;
      for j = i+1:size(A, 1)
        xtemp2 = xtemp2 + A(i, j) * xtotal(j);
      end
      xtotal(i, 1) = (1/A(i,i)) * (b(i) - xtemp - xtemp2);
    end
    rv = [rv; norm(b-A * xtotal)];
    rr = norm(b-A * xcurr) / norm(b);
    if(isnan(rr) || isinf(rr))
      flag = 4;
      x = xcurr;
      return
    end
    if(rr < tol)
      flag = 0;
      x = xcurr;
      return
    end
    if(it == maxit)
      flag = 1;
      x = xcurr;
      return
    end
    xcurr = xtotal;
  end
end