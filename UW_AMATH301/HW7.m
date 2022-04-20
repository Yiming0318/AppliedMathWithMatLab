%hw7
clear all;close all; clc
load('particle_position.mat');
A(1,:) = A(1,:) - mean(A(1,:));
A(2,:) = A(2,:) - mean(A(2,:));
A(3,:) = A(3,:) - mean(A(3,:));
%problem 1
[U,S,V] = svd(A,'econ');
A1 = diag(S)
save('A1.dat','A1','-ascii');
k = 1;
AOf1 = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
error1 = norm(A-AOf1)
save('A2.dat','error1','-ascii');
k = 2;
AOf2 = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
error2 = norm(A-AOf2)
save('A3.dat','error2','-ascii');
%problem 3
A = imread('sherlock.jpg');
A = double(rgb2gray(A));
SVD = svd(A);
A4 = SVD(1:10)
%a
save('A4.dat','A4','-ascii');
%b
A5 = SVD(1,1) / sum(SVD)
save('A5.dat','A5','-ascii');
%c
A6 = sum(A4) / sum(SVD)
save('A6.dat','A6','-ascii');
%d
rank = 0;
for i = 1:640
   Energyofrank = SVD(1:i);
   if sum(Energyofrank) / sum(SVD) >= 0.9
        A7 = i
       break
   end
end
save('A7.dat','A7','-ascii');
%problem 5
%a
load('NoisyImage.mat');
[U,S,V] = svd(A_noise,'econ');
k = 2;
rank2 = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
Sval = diag(S);
energy_rank2 = sum(Sval(1:2)) / sum(Sval)
save('A8.dat','energy_rank2','-ascii');
%b
error = norm(A_noise-rank2)
save('A9.dat','error','-ascii');
errorOfA = norm(A-rank2)
save('A10.dat','errorOfA','-ascii');





