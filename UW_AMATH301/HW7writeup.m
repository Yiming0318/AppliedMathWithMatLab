clear;close all; clc
load('particle_position.mat');
A(1,:) = A(1,:) - mean(A(1,:));
A(2,:) = A(2,:) - mean(A(2,:));
A(3,:) = A(3,:) - mean(A(3,:));
%part 1
%problem 1
[U,S,V] = svd(A,'econ');
A1 = diag(S);
save('A1.dat','A1','-ascii');
k = 1;
AOf1 = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
errorOfRank1 = norm(A-AOf1);
save('A2.dat','errorOfRank1','-ascii');
k = 2;
AOf2 = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
errorOfRank2 = norm(A-AOf2);
save('A3.dat','errorOfRank2','-ascii');
%problem 2
%(a)
for i = 1:101
  plot3(A(1,i),A(2,i),A(3,i),'k.');
  hold on
  plot3(AOf2(1,:),AOf2(2,:),AOf2(3,:),'r.');
end
xlabel('x');ylabel('y');zlabel('z');
legend('position of the particle','rank-2 approximation');






%%
%part 2
%problem 3
close;clear all;clc
A = imread('sherlock.jpg');
A = double(rgb2gray(A));
%remember imshow command
sinVal = svd(A);
A4 = sinVal(1:10);
%(a)
save('A4.dat','A4','-ascii');
%(b)
A5 = sinVal(1,1) / sum(sinVal);
save('A5.dat','A5','-ascii');
%(c)
A6 = sum(A4) / sum(sinVal);
save('A6.dat','A6','-ascii');
%(d)
rank = 0;
for i = 1:640
   rankEnergy = sinVal(1:i);
   if sum(rankEnergy) / sum(sinVal) >= 0.9
        A7 = i;
       break
   end
end
save('A7.dat','A7','-ascii');
%problem 4
[U,S,V] = svd(A);
k = 1;
AOf1 = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
k = 10;
AOf10 = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
k = A7;
AOfr = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
colormap gray
subplot(2,2,1);imagesc(A);title('Original Image');
subplot(2,2,2);imagesc(AOf1);title('Rank-1 Approximation');
subplot(2,2,3);imagesc(AOf10);title('Rank-10 Approximation');
subplot(2,2,4);imagesc(AOfr);title('Rank-r Approximation');



%%
%part 3
%problem 5
%a
load('NoisyImage.mat');
colormap gray
[U,S,V] = svd(A_noise,'econ');
k = 2;
rank2 = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
Sval = diag(S);
energy_rank2 = sum(Sval(1:2)) / sum(Sval);
save('A8.dat','energy_rank2','-ascii');
%b
error = norm(A_noise-rank2);
save('A9.dat','error','-ascii');
errorOfA = norm(A-rank2);
save('A10.dat','errorOfA','-ascii');
%problem 6
semilogy(Sval,'bo');
% subplot(1,3,1);
% imshow(A);title('True Image');
% subplot(1,3,2);
% imshow(A_noise);title('Noisy Image');
% subplot(1,3,3);
% imshow(rank2);title('Rank-2 Approx');