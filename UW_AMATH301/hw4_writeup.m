%hw4 write_up 
clear all; close all;clc;
A = zeros(100);
for k = 1:100
    A(k,k) = 2;
end
for k = 1:99
    A(k,k+1) = -1;
end
for k = 2:100
    A(k,k-1) = -1;
end 
b = zeros(100,1);
for j = 1:100
    b(j,1) = 4 * exp(1) ^( -7 * pi / 101) * sin(7 * pi * j / 101);    
end
D = diag(diag(A));
T = A - D;
M = -D \ T;
c = D \ b;
tol = 10^-4;
x0 = ones(100,1);
x_next = M * x0 + c;
norm_next = norm(x_next - x0,inf);
step = 1;
errorVec(1,1) = norm_next;
while norm_next > tol
    x0 = x_next;
    x_next = M * x0 + c;
    step = step + 1;
    norm_next = norm(x_next - x0,inf);
    errorVec(1,step) = norm_next;
end

k  = 0 : step - 1;
max = max(abs(eig(M)));
vec = zeros(1,step);
for i = 1: step
    vec(i) = max ^(i - 1);
end
semilogy(k,errorVec*5000,'r-'),hold on
plot(k,vec,'k--')
hold off
title('Jacob Method Error')
xlabel('Iterations k')
ylabel('Error  (log scale)')
legend('Jacobi Error','\lambda^k_ max')