clear
clc
%ex1
pC1 = 0.002;
pC2 = 0.005;
pMont = 0.01;
N = 1e5;

comp1 = rand(8,N)<0.002;
comp2 = rand(8,N)<0.005;
mont  = rand(8,N)<0.01;

pDef = ((sum(mont)>=1)+(sum(comp1)>=1)+(sum(comp2)>=1))/N
sum(pDef) 



