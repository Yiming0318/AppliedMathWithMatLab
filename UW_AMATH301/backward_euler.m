function [t,y] = backward_euler(odefun,tspan,y0)
% Backward Euler method
%   Solves the differential equation y' = f(t,y) at the times specified by
%   the vector tspan and with initial condition y0.

    tspan = reshape(tspan,[length(tspan) 1]);
    y0 = reshape(y0,[length(y0) 1]);
    dt = tspan(2)-tspan(1);
    y = zeros(length(y0),length(tspan));
    y(:,1) = y0;
    if length(y0) == 1
        for k = 1:length(y)-1
            g = @ (x) x - y(k) - dt*odefun(tspan(k+1),x);
            y(k+1) = fzero(g,y(k));
        end
    else
        for k = 1:length(y)-1
            g = @ (x) x - y(:,k) - dt*odefun(tspan(k+1),x);
            options = optimset('display','none');
            [y(:,k+1),~,~,~] = fsolve(g,y(:,k),options);
        end
    end
        
    t = tspan;
    y = y.';
    
end