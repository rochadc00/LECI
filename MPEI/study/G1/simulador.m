function probSimulacao = simulador(p,k,n,N)

lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)==k;
probSimulacao = sum(sucessos)/N;
end
