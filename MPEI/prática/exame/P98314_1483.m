% CODE: 1483

% NOME: 
% NO. MEC.: 

% EXERCÍCIO 1
% Considere um processo aleatório que gera dois números: o primeiro número
% de 3 a 6 (com todos os valores igualmente prováveis) e o segundo número
% de 1 a 6 (com todos os valores também igualmente prováveis).
% Seja X a variável aleatória que representa a soma dos dois números.
% (a) (3.0 valores) Estime por simulação (usando 10000 simulações) a função
%     massa de probabilidade da variável aleatória X e apresente-a num
%     gráfico do tipo stem.


N = 10000;
var1 = randi(4, [1,N]);
var2 = randi(6, [1,N]);
sum = var1+var2;

labels = 4:12
massa_prob = zeros(1,length(labels));
for i = labels
   massa_prob(i) = sum(sum == i)/N;
end

stem(labels, massa_prob)

% (b) (2.0 valores) Com base na função massa de probabilidade estimada,
%     estime o valor esperado, a variância e o desvio padrão da variável
%     aleatória X.
% (c) (2.0 valores) Determine o valor teórico da probabilidade de X ser
%     maior que 5, sabendo que o segundo número é 1.





% EXERCÍCIO 2
% Considere um sistema com 4 estados (1, 2, 3 e 4) modelado por uma cadeia
% de Markov com a matriz de transição de estados T seguinte.

T= [0.2 0.4 0.1 0
    0.4 0.3 0.1 0.1
    0.3 0.3 0.8 0.1
    0.1 0   0   0.8];

% (a) (3.0 valores) Qual a probabilidade de o sistema, começando no
%     estado 3, estar no estado 1 após 4 transições?
% (b) (2.0 valores) Qual a probabilidade de o sistema, começando ou no
%     estado 1 ou no estado 2 com igual probabilidade, não estar no
%     estado 4 após 10 transições?





% EXERCÍCIO 3
% Considere um conjunto de 4 páginas web (A, B, C e D) com os hyperlinks
% seguintes entre eles:
% A -> B , B -> C , B -> D , C -> D
%
% (3.0 valores) Determine o pagerank de cada página web ao fim de 10
% iterações assumindo beta = 0.8 e resolvendo primeiro problemas que
% possam existir de 'spider traps' e/ou 'dead-ends'.





% EXERCÍCIO 4
% Considere as 2 funções no fim deste script que implementam duas das
% funcionalidades necessárias à implementação de um filtro de Bloom.
% Considere também os dois conjuntos de chaves seguintes:

CH1= {'Agatha','Anthony','Charles','John','Francis','Jessica','Lewis','Mario'};
CH2= {'Candy','Claire','Debbie','James','William'};

% (a) (3.0 valores) Desenvolva a função que falta para, com as funções
%     fornecidas, ter todas as funcionalidades necessárias à implementação
%     de um filtro de Bloom.
% (b) (2.0 valores) Desenvolva um script que (i) crie um filtro de Bloom
%     de comprimento 200 baseado em 5 funções de dispersão com as
%     chaves de CH1, (ii) teste a pertença das chaves de CH1 no filtro de
%     Bloom criado e (iii) verifique se as chaves de CH2 pertencem ao
%     filtro de Bloom.




function BF= Init(n)
    BF= zeros(n,1);
end

function BF= AddElement(BF,key,k)
    nBF= length(BF);
    key= double(key);
    h= 127;
    for i= 1:length(key)
        h= mod(31*h+key(i),2^32-1);
    end
    for i= 1:k
        h= mod(31*h+i,2^32-1);
        BF(mod(h,nBF)+1)= 1;
    end
end
