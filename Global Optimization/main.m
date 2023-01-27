clear all
clc

func_num=1;
D=30;
Xmin=-100;
Xmax=100;
pop_size=30;
iter_max=1000;

fhd=str2func('cec17_func');

tic
a=1;


chaosdeger=1;

[Alpha_score,Leader_pos,Convergence_curve]= CTSO(pop_size,iter_max,Xmin,Xmax,D,fhd,1,func_num);
                 
            
