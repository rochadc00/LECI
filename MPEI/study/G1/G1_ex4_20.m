n = 20;
N = 1e5;


for k=0:n
    k
    resultado(k+1) = simulador(0.5,k,n,N)
end


stem(0:n,resultado)