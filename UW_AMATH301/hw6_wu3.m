clear all;close all;clc
%problem 4
load('CO2_data.mat');
plot(t,CO2,'-k.');
axis([0 65 300 420]);
hold on;
y = 308.7090*exp(0.0044*t);
plot(t,y,'r');xlabel('Years since 1958');
ylabel('Atmospheric CO2');
legend('data','fit curve','Location','best');
hold off;