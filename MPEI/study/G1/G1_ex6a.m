p = 0.3;
n = 5; %numero de experiencias
prob= nchoosek(n,k)*p^k*(1-p)^(n-k)



lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)==k;
probSimulacao= sum(sucessos)/N