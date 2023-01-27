function [h,g] = constr19(x)
[ps,D]=size(x);
h = zeros(ps,1);
    P = 6000; L = 14; delta_max = 0.25; E = 30*1e6; G = 12*1e6; 
    T_max = 13600; sigma_max = 30000;
    Pc = 4.013.*E.*sqrt(x(:,3).^2.*x(:,4).^6/30)./L.^2.*(1-x(:,3)./(2*L).*sqrt(E/(4.*G)));
    sigma = 6.*P.*L./(x(:,4).*x(:,3).^2);
    delta = 6.*P.*L.^3./(E.*x(:,3).^2.*x(:,4));
    J = 2.*(sqrt(2).*x(:,1).*x(:,2).*(x(:,2).^2/4+(x(:,1)+x(:,3)).^2./4));
    R = sqrt(x(:,2).^2/4+(x(:,1)+x(:,3)).^2/4);
    M = P.*(L+x(:,2)/2);
    ttt = M.*R./J;
    tt = P./(sqrt(2).*x(:,1).*x(:,2));
    t  = sqrt(tt.^2+2.*tt.*ttt.*x(:,2)./(2.*R)+ttt.^2);
    %% constraints
    g(:,1) = t-T_max;
    g(:,2) = sigma-sigma_max;
    g(:,3) = x(:,1)-x(:,4);
    g(:,4) = delta-delta_max;
    g(:,5) = P-Pc;
    g=g';
end 