function [xk,iteration] = Newton(f,fprime,xk,tol,maxIter)
% Performs Newton's method
% Inputs:
%   f = function to find the roots of
%   fprime = derivative of f
%   xk = initial guess
%   tol = tolerance for stopping criteria
%   maxIter = maximum number of iterations
% Outputs:
%   xk = the final guess (an approximation for the root of f)
%   iteration = number of iterations it took to converge

change = 2*tol;
iteration = 0;
while change > tol && iteration < maxIter
    xkplus1 = xk - f(xk)/fprime(xk); 
    change = abs(xkplus1-xk);
    xk = xkplus1; 
    iteration = iteration+1;
end

end

