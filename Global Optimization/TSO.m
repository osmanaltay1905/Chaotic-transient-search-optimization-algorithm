
function [best_score,best_voltage,Convergence_curve]=TSO(SearchAgents_no,L,lb,ub,dim,fobj,varargin)
best_voltage=zeros(1,dim);% initialize best voltage vector
best_score=inf; %change this to -inf for maximization problems
voltages=rand(SearchAgents_no,dim).*(ub-lb)+lb;%Initialize the voltages of search agents

l=0;
% L=500;

% Main loop
while l<L
    for i=1:size(voltages,1)
        
        % Return back the search agents that go beyond the boundaries of the search space
        Flag4ub=voltages(i,:)>ub;
        Flag4lb=voltages(i,:)<lb;
        voltages(i,:)=(voltages(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
               
%         fitness=fobj(voltages(i,:));% Calculate objective function for each search agent
        fitness=feval(fobj,voltages(i,:)',varargin{:});
        % Update the best
        if fitness<best_score 
            best_score=fitness; 
            best_voltage=voltages(i,:);
        end
        
    end
    
    t=2-l*(2/L); 
    K=1;   % K is a real can be 0, 1, 2,....
    % Update the voltage of search agents 
    for i=1:size(voltages,1)
        r1=rand();r2=rand(); 
        r3 = rand();
        T=2*t*r1-t;  
        C1=K*r2*t+1;            
               
        for j=1:size(voltages,2)
           
            if r3<0.5
           
                voltages(i,j)=best_voltage(j)+exp(-T)*(voltages(i,j)-C1*best_voltage(j));
                
            elseif r3>=0.5
            
              voltages(i,j)=best_voltage(j)+exp(-T)*(cos(T*2*pi)+sin(T*2*pi))*abs(voltages(i,j)-C1*best_voltage(j));

            end
                        
        end
    end
    l=l+1;
    Convergence_curve(l)=best_score;
end
