N= 1e5;

comp1= rand(8, N)<0.002; 

comp2= rand(8, N)<0.005;

compm= rand(8,N)<0.01;

SumComp1= sum(comp1);
SumComp2= sum(comp2);
SumCompa= sum(compm);

sumtotal= SumComp1+SumComp2+SumCompa>=1;

BrinquedosDefeituosos= sum(sumtotal);

X=0:8;
pX=zeros(1,9);
for i=X
    pX(i+1)= sum(sumtotal==i)/N
end

stem(X,pX)
 xlabel('brinquedos defeituosos');
 ylabel('Probabilididade de haver brinquedos defeituosos numa caixa.')
axis([-1 8 0 0.9]) %limites do gráfico
grid on