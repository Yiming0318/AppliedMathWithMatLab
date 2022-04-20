%hw4
clear all;close all; clc;
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
%problem 1b
x_exact = A \ b;
save('A1.dat','x_exact','-ascii');
%problem 1c
D = diag(diag(A));
T = A - D;
%A and T is good now.
M = (-D ^-1) * T;
c = (D ^ -1) * b; 
eiVec = eig(M);
eiVec1 = abs(eiVec);
A2 = max(eiVec1);
save('A2.dat','A2','-ascii');
x0 = ones(100,1);%% initial guess of all ones
tol = 10^-4;
%%problem 1(d)
[x,numIter] = jacobiIter(A,b,x0,tol,5000);
error = norm(abs(x_exact - x),2);
A3(1,1) = numIter;
A3(1,2) = error;
save('A3.dat','A3','-ascii');

%%problem 1(e)
S = tril(A,0); 
T = A - S;
M = -S \ T;
A4 = max(abs(eig(M)));
save('A4.dat','A4','-ascii');
[x,numIter] = gsIter(A,b,x0,10^-4,5000);
error = norm(abs(x_exact - x),2);
A5(1,1) = numIter;
A5(1,2) = error;
save('A5.dat','A5','-ascii');

%%problem 2(a)
D = diag(diag(A));
U = triu(A,1);
L = tril(A,-1);
P = 1/ 1.5 * D + L;  
T = (1.5 - 1)/ 1.5 * D +U;
M = -P \ T;
B = P \ b;
A6 = max(abs(eig(M)));
save('A6.dat','A6','-ascii');   
%%problem2 (b)
for i = 1:10000
    x_next = M * x0 + B;
    if norm(x_next - x0,inf) < tol
        break
    else
        x0 = x_next;
    end

end
err = norm(x_exact-x_next);
A7(1,1) = i;
A7(1,2) = err;
save('A7.dat','A7','-ascii');  
%%problem2 (c)
matStep = 0;
current = 1000;
for i = 1:0.01:1.99
    matStep = matStep + 1;
    D = diag(diag(A));
    L = tril(A,-1);
    U = A - L - D;
    P = (1/i)*D + L;
    T = ((i -1 )/ i) *D + U;
    M = -P \ T;
    Vmax = max(abs(eig(M)));
    if Vmax < current
        current = Vmax;
        optimal = i;
    end
    
end
save('A8.dat','optimal','-ascii');
P = (1/1.94) * D + L;
T = ((1.94 - 1) / 1.94) * D + U;
M = - P \ T;
max = max(abs(eig(M)));
save('A9.dat','max','-ascii');
%%problem 2 (d)
T = (1.94 -1) / 1.94 * D + U;
P = 1 / 1.94 * D + L;
M = -P \ T;
B = P \ b;
x0 = ones(100,1);
for i = 1:10000
    x_next = M * x0 + B;
    if norm(x_next - x0,inf) < 10^-4
        break
    else
        x0 = x_next;
    end
end
x0 = ones(100,1);
err = norm(x_exact - x_next);
A10 = [i,err];
save('A10.dat','A10','-ascii');