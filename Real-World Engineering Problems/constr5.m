function [h,g] = constr20(x)
[ps,D]=size(x);
 %% Three-bar truss design problem
    g(:,1) = (sqrt(2).*x(:,1)+x(:,2))./(sqrt(2).*x(:,1).^2+2.*x(:,1).*x(:,2))*2-2;
    g(:,2) = x(:,2)./(sqrt(2).*x(:,1).^2+2.*x(:,1).*x(:,2))*2-2;
    g(:,3) = 1./(sqrt(2).*x(:,2)+x(:,1))*2-2;
    h      = zeros(ps,1);
end