clear all;close all;clc
%problem 8
load('CO2_data.mat');
plot(t,CO2,'-k.');
axis([0 65 300 420]);
hold on;
y = 58.9388*exp(0.0159*t)+254.3470+2.7936*sin(6.2838*(t-0.1030));
plot(t,y,'r');xlabel('Years since 1958');
ylabel('Atmospheric CO2');
legend('data','fit curve','Location','best');
hold off;