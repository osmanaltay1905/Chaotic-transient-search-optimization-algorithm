% Notation: This fitness function is for demonstration 

function cost = jFitnessFunction(feat,label,X,HO)
if sum(X == 1) == 0
  cost = 1;
else
  cost = jwrapperKNN(feat(:, X == 1),label,HO);
end
end


function error = jwrapperKNN(sFeat,label,HO)
%---// Parameter setting for k-value of KNN //
k = 1; 
xtrain = sFeat(HO.training == 1,:);
ytrain = label(HO.training == 1); 
xvalid = sFeat(HO.test == 1,:); 
yvalid = label(HO.test == 1); 

% Sınıflandırma yöntemleri
Model     = fitcknn(xtrain,ytrain,'NumNeighbors',k); 
% Model     = fitctree(xtrain,ytrain); 
% Model     = fitcdiscr(xtrain,ytrain,'DiscrimType','diagQuadratic');
% Model     = fitcsvm	(xtrain,ytrain); 
% Model     = fitclinear	(xtrain,ytrain); 
% Model     = fitckernel	(xtrain,ytrain); 


% Model  = fitcnb(xtrain,ytrain); 


pred      = predict(Model,xvalid);
num_valid = length(yvalid); 
correct   = 0;
for i = 1:num_valid
  if isequal(yvalid(i),pred(i))
    correct = correct + 1;
  end
end
Acc   = correct / num_valid; 
error = 1 - Acc;
end

