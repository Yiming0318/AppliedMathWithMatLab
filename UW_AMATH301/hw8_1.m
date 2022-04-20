clear all;close all;clc
load('Plutonium.mat');
A1 = (P(30) - P(28)) / 2;
save('A1.dat','A1','-ascii');
A2 = (-3/2)*P(1) + 2 * P(2) + -1/2 * P(3);
save('A2.dat','A2','-ascii');
A3 = (3 * P(41) - 4 * P(40) + P(41 - 2))/2;
save('A3.dat','A3','-ascii');
decayVec(1,1) = (P(2) - P(1)) * (-1 / P(1));
decayVec(1,41) = (P(41) - P(40)) * (-1 / P(41));
for i = 2:40
    decayVec(1,i) = (P(i+1) - P(i-1)) / 2 * (-1 / P(i));
end
A4 = mean(decayVec);
save('A4.dat','A4','-ascii');
A5  = log(2) / A4;
save('A5.dat','A5','-ascii');
load('BloodFlow.mat');
A6 = trapz(r,2*pi*v.*r);
save('A6.dat','A6','-ascii');
delta = 1e-3;
A = 0;
for i = 1:14
    A = A + 2 * pi* r(i) * delta;
end
save('A7.dat','A','-ascii');
A8 = A6 / A;
save('A8.dat','A8','-ascii');
load('Dye.mat');
deltat = 0.08;
x2 = 0;
x1 = 0;
for k = 2:2:100
    x1 = x1 +4*c(k);
end
for j = 3:2:99
    x2 = x2 +2*c(j);
end
integral = (deltat/3)*(c(1)+c(101)+x1+x2);
A9 = integral;
A = 2;
A10 = A/integral;
save('A9.dat','A9','-ascii');
save('A10.dat','A10','-ascii');