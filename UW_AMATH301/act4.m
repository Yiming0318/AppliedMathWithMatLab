
clear all;close all;clc
n = 1000;
A = rand(n);
b = rand(n,1);
tic
x = A\b;
backslashtime = toc 

X = linspace(1000,500,4000);
Y = 2*X - 0.3;
loglog(X,Y)