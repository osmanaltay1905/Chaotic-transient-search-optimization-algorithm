N=30; 

Function_name='F5'; 

T=100; 

[lb,ub,dim,fobj]=realWorld(Function_name);
chaosDeger=1;
[Destination_fitness,bestPositions,Convergence_curve,karar]=CTSO(N,T,lb,ub,dim,fobj,chaosDeger);