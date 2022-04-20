%lecture 4
clear;close all; clc;
x = linspace(0,2*pi,1000);
y = sin(x);
plot(x,y);
axis([1,4,-1,1]) %([xmin,xmax,ymin,ymax])

%%
clear;close all;clc;
left = 1;
right = 5;
tol = 1e-8
x = linspace(-5,5,1000);
f = @(x)exp(-x)-x^2+2; %function name = @(variable names)function itself

for k = 1:5
    mid = (left + right)/2;
    f_mid = f(mid);
    
    if abs(f_mid)<tol
        break
    elseif f_mid*f(left) < 0
        right = mid;
    else
        left = mid;
    end
end

mid