caixas = 1e5;
n=8; %brinquedos
p = [];
ns = [];

for k=2:20
   probK = compute(k, caixas);
   ns= [ns k];
   p = [p probK];
end
 plot(ns, p)
 xlabel('brinquedos');
 ylabel('ProbabilididadeB');
 
%function [y1,...,yN] = myfun(x1,...,xM)
function [semDef] = compute(n, exp)
    c1 = randi([1,1000], n, exp) >=3;
    c2 = randi([1,1000],n, exp)>=6;
    mtg = randi([1,100], n, exp)>=2;
    fim = c1 & c2 & mtg;
    corretas = sum(fim)==n;
    valida = sum(corretas);
    semDef = valida/exp;
end

