p = 0.5; % probabilidade de filho rapaz
N = 1e5; % numero de experiencias
n = 2;   % numero de filhos
k = 1;   % caso ser rapaz

nascimentos = rand(n,N) > p;
rapaz = sum(nascimentos)>=k;
probSimulacao = sum(rapaz)/N