diasTotal = 365;
N = 1e5;
nPessoas = 1;
p = 0;

while p < 0.9
    nPessoas = nPessoas + 1;
    aniversarios = randi(diasTotal,nPessoas,N);
    res = true(1,N);
    for i = 1:N
        res(i) = length(unique(aniversarios(:,i))) < nPessoas;
    end
    p = sum(res)/N;
   
end
   fprintf('Resultado = %d\n', nPessoas)