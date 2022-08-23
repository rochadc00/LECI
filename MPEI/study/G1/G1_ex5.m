p = 0.5;
n = 40; %outros valores como 20 ou 100

for k=0:n
    probSimulacao(k+1)= nchoosek(n,k)*p^k*(1-p)^(n-k);
end


stem(0:n,probSimulacao)
