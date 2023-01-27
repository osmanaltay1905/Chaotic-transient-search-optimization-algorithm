function [h,g] = constr17(x)
% Matlab Code by A. Hedar (Nov. 23, 2005).
% Constraints
[ps,D]=size(x);
    h = zeros(ps,1);
    g(:,1) = 1-(x(:,2).^3.*x(:,3))./(71785.*x(:,1).^4);
    g(:,2) = (4.*x(:,2).^2-x(:,1).*x(:,2))./(12566.*(x(:,2).*x(:,1).^3-x(:,1).^4))....
             + 1./(5108.*x(:,1).^2)-1;
    g(:,3) = 1-140.45.*x(:,1)./(x(:,2).^2.*x(:,3));
    g(:,4) = (x(:,1)+x(:,2))./1.5-1;
% *************************************************************************
g=g';
h=[];
end