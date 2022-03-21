function [x,flag,rr,it,rv] = jacobi(A,b,tol,maxit)
%
%%     Jacobi method    %%
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
  % choose initial guess (e.g. x0 = b)
  % compute residue of the first aproximation (initial guess) - first element of vector rv
  % compute first relative residue - rr
  
  % cycle for/while over iterations
  %   cycle i over size of matrix A
  %      compute new aproximation of x(i)
  %   end of cycle i
  %   compute next residue and add to rv
  %   compute next relative residue rr
  %   check rr for inf or nan value (functions isnan, isinf)
  %   check if convergence is reached (tol or maxit) and set flag
  % end of cycle 
  
  % ...
end