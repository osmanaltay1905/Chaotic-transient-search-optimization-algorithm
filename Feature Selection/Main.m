
clc, clear, close; 
% Benchmark data set 
% load ionosphere.txt;
% feat=ionosphere(:,1:34);
% label=ionosphere(:,35);

% load Australian.txt;
% feat=Australian(:,1:14);
% label=Australian(:,15);

load sonar.txt;
feat=sonar(:,1:60);
label=sonar(:,61);

% load spectfheart.txt;
% feat=spectfheart(:,1:44);
% label=spectfheart(:,45);

% load spambase.txt;
% feat=spambase(:,1:57);
% label=spambase(:,58);

% load wine.txt;
% feat=wine(:,1:13);
% label=wine(:,14);

% load heart.txt;
% feat=heart(:,1:13);
% label=heart(:,14);

% load thyroid.txt;
% feat=thyroid(:,1:21);
% label=thyroid(:,22);

% load vehicle.txt;
% feat=vehicle(:,1:18);
% label=vehicle(:,19);

% load krvskp.txt;
% feat=krvskp(:,1:36);
% label=krvskp(:,37);

% load tictactoe.txt;
% feat=tictactoe(:,1:9);
% label=tictactoe(:,10);

% Set 20% data as validation set
ho = 0.2; 
% Hold-out method
HO = cvpartition(label,'HoldOut',ho)

% Parameter setting
N        = 10; 
max_Iter = 100; 
% TSO parametre kaos için
Chaos=1;







            [best_score, sFeat,Sf,Nf,curve] = jCTSO(feat,label,N,max_Iter,1,HO,Chaos);
            
        
