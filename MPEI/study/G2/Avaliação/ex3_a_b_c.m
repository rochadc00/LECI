%% Alinea a
N=1e5;
n = 8; %8 brinquedos na caixa
probA = 0.002;
probB = 0.005;
probC = 0.01;

primeiroComponente = rand(n,N) <= probA;
segundoComponente  = rand(n,N) <= probB;
montagem           = rand(n,N) <= probC;

res = ones(1,n+1);
for i=1:n+1
    res(i) = sum(sum(primeiroComponente+segundoComponente+montagem)==i-1)/N;
end
res
stem(0:n, res)
axis([-1 9 -0.2 1])
grid on

%% Alinea b
% P(X>=2) = 1 - P(X<2) = 1 - P(X=1) - P(X=0)
probMaiorIgualDois = 1 - res(1) -res(2) 

fprintf('P(X>=2): %f\n', probMaiorIgualDois);

%% Alinea c

valores_x = 0:n;

esperado = sum(valores_x .* res)
variancia = sum(valores_x .^2.*res)-esperado^2
desvio_padrao = sqrt(variancia)