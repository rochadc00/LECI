N=1e5;
alvos = 100;
dardos = 20;

jogadas = randi(alvos,dardos,N);

for i = 1:N
    res(i) = length(unique(jogadas(:,i)))== dardos;
end

res
prob = sum(res)/N