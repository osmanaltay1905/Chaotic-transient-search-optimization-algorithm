function [best_score, sFeat,Sf,Nf,Convergence_curve] = jCTSO (feat,label,N,max_Iter,chaosDeger, HO,Chaos)
lb  = 0;
ub  = 1; 

fun = @jFitnessFunction; 
dim = size(feat,2);  

% initialize position
best_voltage=zeros(1,dim);% initialize best voltage vector
best_score=inf; %change this to -inf for maximization problems


voltages=rand(N,dim).*(ub-lb)+lb;%Initialize the voltages of search agents


if chaosDeger<=10
    kaotik=chaos(chaosDeger,90000,Chaos);
end
elif=1;

    for i = 1:N
  AllFitness(i) = fun(feat,label,(voltages(i,:) > 0.5),HO);
  if AllFitness(i) < best_score
    best_score = AllFitness(i); 
    bestPositions  = voltages(i,:);
  end
end


AllFitness = inf*ones(N,1);%record the fitness of all slime mold
%Initialize the set of random solutions

Convergence_curve=inf;
it=1;  %Number of iterations
 
% Main loop
while it<max_Iter
%       

        % Update the best
        if AllFitness<best_score 
            best_score=fitness; 
            best_voltage=voltages(i,:);
        end
        

    
    t=2-it*(2/max_Iter); 
    K=1;   % K is a real can be 0, 1, 2,....
    % Update the voltage of search agents 
    for i=1:size(voltages,1)
        r1=rand();r2=rand(); 
        r3 = rand();
        
        
        T=2*t*r1-t;
%         elif=elif+1;
        C1=K*kaotik(elif)*t+1;            
        elif=elif+1;       
        for j=1:size(voltages,2)
           
            if r3<0.5
           
                voltages(i,j)=best_voltage(j)+exp(-T)*(voltages(i,j)-C1*best_voltage(j));
                
            elseif r3>=0.5
            
              voltages(i,j)=best_voltage(j)+exp(-T)*(cos(T*2*pi)+sin(T*2*pi))*abs(voltages(i,j)-C1*best_voltage(j));

            end
                        
        end
    end
  
     for i = 1:N
  AllFitness(i) = fun(feat,label,(voltages(i,:) > 0.5),HO);
  if AllFitness(i) < best_score
    best_score = AllFitness(i); 
    best_voltage  = voltages(i,:);
  end
end
    Convergence_curve(it)=best_score;
    it=it+1;
end
best_score
Pos   = 1:dim;
Sf    = Pos((bestPositions > 0.5) == 1);
Nf    = length(Sf);
sFeat = feat(:,Sf); 
end

