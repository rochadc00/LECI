clc
clear all
%% ex2 / ex3
load keys;
Nchaves = length(keys);
Ntabela = 5e5;
%Ntabela = 1e6;
%Ntabela = 2e6;
valores = zeros(1,Nchaves);
tabela = zeros(1,Ntabela);
colisoes = 0;
tic
for i = 1:Nchaves
%   hash = string2hash(keys{i});
%   hash=mod(hash,Ntabela)+1;

%   hash = string2hash(keys{i},'sdbm');
%   hash=mod(hash,Ntabela)+1;

%   hash = hashstring(keys{i},Ntabela)+1;

   hash = DJB31MA(keys{i},127);
   hash = mod(hash,Ntabela)+1;
   
   valores(i) = hash;
   if tabela(hash)>0
       colisoes = colisoes + 1;
   end
   tabela(hash) = tabela(hash) + 1;
end
tempo = toc;

h = valores/Ntabela;
histogram(valores,100)
fprintf('Momento 2:  medido- %f teórico-%f\n',mean(h.^2),1/(2+1));
fprintf('Momento 5:  medido- %f teórico-%f\n',mean(h.^5),1/(5+1));
fprintf('Momento 10: medido- %f teórico-%f\n',mean(h.^10),1/(10+1));
fprintf('Numero de colisões = %d\n',colisoes);
fprintf('Numero de atribuições = %d\n',max(tabela));
fprintf('Tempo de execução = %f\n',tempo);