clear; close all; clc
%problem 3
x1sum = 0;
for k = 1:20000
    x1sum = x1sum + 0.1;
end 
x1 = abs(2000 - x1sum);
disp(x1)

x2sum = 0;
for k = 1:16000
    x2sum = x2sum + 0.125;
end
x2 = abs(2000 - x2sum);
disp(x2)

x3sum = 0;
for k = 1:10000
    x3sum = x3sum + 0.2;
end
x3 = abs(2000 - x3sum);
disp(x3)

x4sum = 0;
for k = 1:8000
    x4sum = x4sum + 0.25;
end
x4 = abs(2000 - x4sum);
disp(x4)

%x2 and x4 are exactly zero
%x1 and x3 are not exactly zero


%problem 4
%img1
r = 3;
P = zeros(1,101);
P(1) = 0.4;
T = [0:100];
for k = 2:101
    P(k) = r*P(k-1)*(1-P(k-1));
end
 plot(T,P,'k','Linewidth',[2]);hold on;
 plot(T,P,'ko','Linewidth',[2]);
 xlabel('time');
 ylabel('population');
 title('r = 3');
 print('fig1.jpg','-djpeg');
 hold off;

%img2
r = 3.5;
P = zeros(1,101);
P(1) = 0.4;
T = [0:100];
for k = 2:101
    P(k) = r*P(k-1)*(1-P(k-1));
end

 plot(T,P,'k','Linewidth',[2]),hold on;
 plot(T,P,'ko','Linewidth',[2]);
 xticks(0:20:100);
 yticks(0:0.2:1);
 ylim([0 1]);
 xlabel('time');
 ylabel('population');
 title('r = 3.5');
 print('fig2.jpg','-djpeg');
 hold off;
 
%img3
r = 4;
P = zeros(1,101);
P(1) = 0.4;
T = [0:100];
for k = 2:101
    P(k) = r*P(k-1)*(1-P(k-1));
end

 plot(T,P,'k','Linewidth',[2]),hold on;
 plot(T,P,'ko','Linewidth',[2]);
 xlabel('time');
 ylabel('population');
 title('r = 4');
 print('fig3.jpg','-djpeg');
 hold off;
