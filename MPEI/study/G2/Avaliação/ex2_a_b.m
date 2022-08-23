%a)
N = 1e6;

comp1= rand(8, N)<0.002; 

comp2= rand(8, N)<0.005;

compm= rand(8,N)<0.01;

SumComp1= sum(comp1);
SumComp2= sum(comp2);
SumCompa= sum(compm);

sumtotal= SumComp1+SumComp2+SumCompa==0;

probabilidadeB =sum(sumtotal)/N

%b)
%probabilidade de sair com defeito = (0,002*0,005*0.01 + 0,002*0.01 + 0,005*0.01 +
%0,002*0.005 + 0.002 + 0.005 + 0.01)*8 = 0,0170801*8=0.1366408

%probabilidade de sair sem defeito = 1-0,0170801 = 0,8633592



