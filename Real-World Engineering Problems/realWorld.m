
function [lb,ub,dim,fobj] = realWorld(F)

switch F    
       case 'F1'
        fobj = @F1;
        lb=[2.6, 0.7, 17, 7.3, 7.3, 2.9, 5];
        ub=[3.6, 0.8, 28, 8.3, 8.3, 3.9, 5.5];
        dim=7;
       case 'F2'
        fobj = @F2;
        lb=[0.05,0.25,2.00];
        ub=[2,1.3,15.0];
        dim=3;
       case 'F3'
        fobj = @F3;
        lb=[0.51,0.51,10,10];
        ub=[99.49,99.49,200,200];
        dim=4;
       case 'F4'
        fobj = @F4;
        lb=[0.125,0.1,0.1,0.1];
        ub=[2,10,10,2];
        dim=4;
       case 'F5'
        fobj = @F5;
        lb=[0 0];
        ub=[1 1];
        dim=2;
       
end
end
    
   
        function [o, karar, penalty] = F1(x)    %% Weight Minimization of a Speed Reducer
    
    scale_factor=10000000;
     
   o = 0.7854*x(:,1).*x(:,2).^2.*(3.3333.*x(:,3).^2+14.9334.*x(:,3)-43.0934)-1.508.*x(:,1).*(x(:,6).^2+x(:,7).^2).....
        +7.477.*(x(:,6).^3+x(:,7).^3)+0.7854.*(x(:,4).*x(:,6).^2+x(:,5).*x(:,7).^2);
    

penalty = 0.0;
[h,g] = constr1(x);
for i = 1:length(h)
    if h(i)~=0
        penalty = penalty + h(i)^2;
    end
end
for i = 1:length(g)
    if g(i)>0
        penalty = penalty + g(i)^2;
    end
end
karar=[x(:,1),x(:,2),x(:,3),x(:,4), x(:,5), x(:,6), x(:,7)];
o = o+penalty*scale_factor;
        end
    
    function [o, karar, penalty] = F2(x)    
  %% Tension/compression  spring  design (case 1)
    scale_factor=10000000;
     
    o = x(:,1).^2.*x(:,2).*(x(:,3)+2);
   
penalty = 0.0;
[h,g] = constr2(x);
for i = 1:length(h)
    if h(i)~=0
        penalty = penalty + h(i)^2;
    end
end
for i = 1:length(g)
    if g(i)>0
        penalty = penalty + g(i)^2;
    end
end
karar=[x(:,1),x(:,2),x(:,3)];
o = o+penalty*scale_factor;
    end
    
    function [o,karar,penalty] = F3(x)    
 %% Pressure vessel design
    scale_factor=10000000;
    x(:,1) = 0.0625.*round(x(:,1));
    x(:,2) = 0.0625.*round(x(:,2));
    o = 0.6224.*x(:,1).*x(:,3).*x(:,4)+1.7781.*x(:,2).*x(:,3).^2....
        +3.1661.*x(:,1).^2.*x(:,4)+19.84.*x(:,1).^2.*x(:,3);
   
penalty = 0.0;
[h,g] = constr3(x);
for i = 1:length(h)
    if h(i)~=0
        penalty = penalty + h(i)^2;
    end
end
for i = 1:length(g)
    if g(i)>0
        penalty = penalty + g(i)^2;
    end
end

karar=[x(:,1),x(:,2),x(:,3),x(:,4)];
o = o+penalty*scale_factor;
    end
   
    function [o, karar, penalty] = F4(x)    
 %% Welded beam design
    scale_factor=10000000;
    o = 1.10471.*x(:,1).^2.*x(:,2)+0.04811.*x(:,3).*x(:,4).*(14+x(:,2));
   
penalty = 0.0;
[h,g] = constr4(x);
for i = 1:length(h)
    if h(i)~=0
        penalty = penalty + h(i)^2;
    end
end
for i = 1:length(g)
    if g(i)>0
        penalty = penalty + g(i)^2;
    end
end
karar=[x(:,1),x(:,2),x(:,3),x(:,4)];
o = o+penalty*scale_factor;
    end
    
    function [o, karar,penalty] = F5(x)    
 %% Three-bar truss design problem
    scale_factor=10000000;
    o = (2.*sqrt(2).*x(:,1)+x(:,2))*100;
   
penalty = 0.0;
[h,g] = constr5(x);
for i = 1:length(h)
    if h(i)~=0
        penalty = penalty + h(i)^2;
    end
end
for i = 1:length(g)
    if g(i)>0
        penalty = penalty + g(i)^2;
    end
end
karar=[x(:,1),x(:,2)];
o = o+penalty*scale_factor;
end
    


