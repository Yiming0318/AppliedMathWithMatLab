%homework0
clear; close all; clc

%problem1
x = 10;
y = -2;
z = pi;

save('A1.dat','z','-ascii')

a2 = x+y-z;
save('A2.dat','a2','-ascii')

a5 = cos(z*y);
save('A5.dat','a5','-ascii')

%problem2
A = [-1 2 1; 3 1 -1];
a7 = A(2,1:3);
save('A7.dat','a7','-ascii')

plot(A, A);
