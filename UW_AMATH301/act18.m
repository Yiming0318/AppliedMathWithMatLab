%%act12
clc;clear all;close all;
dydt = @ (t,y) [1+sin(y(2)-y(1)); 1.5+sin(y(1)-y(2))];
exact_sol = [251.3736598724289 251.6263401275710];
tspan = linspace(0,200,200);
y0=[3;0];
[t_sol,y_sol] = forward_euler(dydt,tspan,y0);
yFE = y_sol(end);
error1 = abs(exact_sol - yFE);

[t_sol,y_sol] = backward_euler(dydt,tspan,y0);
yBE = y_sol(end);
error2 = abs(exact_sol - yBE);

[t_sol,y_sol] = midpoint(dydt,tspan,y0);
yMid = y_sol(end);
error3 = abs(exact_sol - yMid);

[t_sol,y_sol] = ode45(dydt,tspan,y0);
yOde = y_sol(end);
error4 = abs(exact_sol - yOde);





