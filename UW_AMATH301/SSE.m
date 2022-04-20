function error = SSE(x0)
load('CO2_data.mat');
y = @(t)x0(1).*exp(x0(2).*t) + x0(3)+x0(4).*sin(x0(5).*(t-x0(6)));
error = sum((CO2 - y(t)).^2);
end