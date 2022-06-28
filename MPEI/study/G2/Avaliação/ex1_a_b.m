p1 = 0.002;     %componente 1 com defeito 
p2=0.005;       %componete 2 com defeito
%um brinquedo está com defeito se pelo menos o 1 ou 2 estiverem com defeitos.
N=1e7;
pa =0.01;       %processo de montagem com defeito

%a)
n=8;            %numero de brinquedos
brinquedos = rand(8,N);

comp1= rand(8, N)<0.002; 

comp2= rand(8, N)<0.005;

compm= rand(8,N)<0.01;

SumComp1= sum(comp1);
SumComp2= sum(comp2);
SumCompm= sum(compm);

sumtotal= SumComp1+SumComp2+SumCompm>=1;


ProbabilidadeA = sum(sumtotal)/N

%b)

comp1= rand(8, N)<0.002; 

comp2= rand(8, N)<0.005;

compm= rand(8,N)<0.01;

SumComp1= sum(comp1);
SumComp2= sum(comp2);
SumCompm= sum(compm);

MatrizFinal = SumComp1 | SumComp2 |SumCompm;


DefeitoMontagem = sum(SumCompm);


media= DefeitoMontagem/sum(MatrizFinal)



