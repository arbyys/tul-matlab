function [x,flag,rr,it,rv] = gauss_seidel(A,b,tol,maxit)
%
%%     Gauss-Seidel's method    %%
%
% arguments:
% A - matrix
% b - right hand side
% tol - relative tolerance
% maxit - maximum number of iterations
%
% returns:
% x - result vector
% flag - 0 if converged, 
%        1 if tolerance not reached in maximum number of iterations
%        4 if one of the scalar quantities calculated during pcg became too
%          small or too large to continue computing
% rr - relative residue
% it - number of iterations
% rv - vector of residues at each iteration

  %ALGORITHM:
  %
  x = 
  % choose initial guess (e.g. x0 = b)
  x0 = b;
  % compute residue of the first aproximation (initial guess) - first element of vector rv
  rv = b-Ax;
  % compute first relative residue - rr
  rr = norm(b-Ax) ./ norm(b);
  
  for iteration = 1:maxit
  % cycle for/while over iterations
    for i = 0:size(A)
  %   cycle i over size of matrix A
      x(i) = 
  %      compute new aproximation of x(i) - use already computed x(k), k<i
    end
  %   end of cycle i
  %   compute next residue and add to rv
  %   compute next relative residue rr
  %   check rr for inf or nan value (functions isnan, isinf)
  %   check if convergence is reached (tol or maxit) and set flag
  % end of cycle 
  end
  
  % ...
end