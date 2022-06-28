% Tendo uma familia 2 filhos e sendo já 1 rapaz
%temos:
%Rapaz + Rapaz, Rapariga + Rapaz, Rapaz + Rapariga.
%Logo, temos 1 caso favoravel em 3 possibilidades.

N = 1e5;
n = 2;
p = 0.5;


a = rand(n,N)> p; %nascimentos
a1 = sum(a)>=2;
a2 = sum(a)>=1;

prob = sum(a1 & a2)/sum(a2)