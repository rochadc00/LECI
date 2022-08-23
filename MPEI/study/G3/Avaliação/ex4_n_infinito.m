clc
clear all
%% 3)
    
    fid= fopen('wordlist-preao-20201103.txt','r');
    dicionario= textscan(fid,'%s');
    fclose(fid);
    dicionario= dicionario{1,1};
    words = {};
    set_of_letters= 'amor';
    
    for i = 1:length(dicionario)
        wordAtual = dicionario{i,1};
        if min(ismember(wordAtual,set_of_letters))
            words{end+1} = wordAtual;
        end
    end
    
    % guarda apenas as palavras que contenham as letras indicadas em
    % set_of_letters (mesmo que não tenho todas (min))
    
    letters = ['a' 'm' 'o' 'r'];
    ocorrencias = [0 0 0 0];
    
    
    for i = 1:length(words)
        if (words{i}(1) == 'a')
            ocorrencias(1) = ocorrencias(1) + 1;
        elseif (words{i}(1) == 'm')
            ocorrencias(2) = ocorrencias(2) + 1;
        elseif (words{i}(1) == 'o')
            ocorrencias(3) = ocorrencias(3) + 1;
        elseif (words{i}(1) == 'r')
            ocorrencias(4) = ocorrencias(4) + 1;
        end    
    end
    
    probabilidade = ocorrencias/length(words);
    
    % para calcular as probs de iniciar com cada letra criamos um array de
    % cada uma das letras e um array das ocorrencias, respetivamente, cada
    % posição do array de ocorrencias é incrementada caso a palavra gerada
    % seja iniciada por essa letra 
    
    %a  %m  %o  %r  %.
T= [0   0.7 0   0.6 0
    0.2 0   0.2 0.1 0
    0.1 0.2 0   0.3 0
    0.3 0   0.3 0   0
    0.4 0   0.5 0   0];


N = 1e5;
set_of_letters= 'amor';
lista = {};

a = rand;
if (a < probabilidade(1))
    state = crawl(T, 1, 5);
elseif (a < probabilidade(1) + probabilidade(2))
    state = crawl(T, 2, 5);
elseif (a < probabilidade(1) + probabilidade(2) + probabilidade(3))
    state = crawl(T, 3, 5);
else
    state = crawl(T, 4, 5);
end

state = state(1:length(state)-1);
word = set_of_letters(state);
lista{1}= word;
cont{1} = 1;

    for k = 2:N
        a = rand;
        if (a < probabilidade(1))
            state = crawl(T, 1, 5);
        elseif (a < probabilidade(1) + probabilidade(2))
            state = crawl(T, 2, 5);
        elseif (a < probabilidade(1) + probabilidade(2) + probabilidade(3))
            state = crawl(T, 3, 5);
        else
            state = crawl(T, 4, 5);
        end
        
        state = state(1:length(state)-1);
        word = set_of_letters(state);
        
        a= ismember(lista,word); %returns an array of booleans
        pos= find(a==true);      %return the position(s) of the true
        if isempty(pos)
            lista{end+1} = word;
            cont{end+1} = 1;
        else 
            cont{pos} = cont{pos}+1; 
        end
    end


prob = {};
for i = 1:length(lista)
    prob{i} = cont{i}/N; 
end

[f,i] = sort(cell2mat(prob),'descend');

for j = 1:5
    fprintf('A %d ª palavra mais provavel é " %s " e o seu valor de probabilidade é: %f \n',j, lista{i(j)}, prob{i(j)} );
end


fprintf('Numero de palavras unicas geradas: %d\n',length(lista));

soma = 0;
for i = 1:length(lista)
     a= ismember(lista{i},dicionario); %returns an array of booleans
     pos= find(a==true);               %return the position(s) of the true
     if ~isempty(pos)
       soma = soma + prob{i};
     end
end
    
    fprintf('Probabilidade de gerar uma palavra portuguesa valida é %f\n',soma);

 
%% crawl->

function state = crawl(H, first, last)
    % the sequence of states will be saved in the vector "state"
    % initially, the vector contains only the initial state:
    state = [first];
    % keep moving from state to state until state "last" is reached:
    while (1)
        state(end+1) = nextState(H, state(end));
        if (state(end) == last)
            break;
        end
    end
end

% Returning the next state
% Inputs:
% H - state transition matrix
% currentState - current state
function state = nextState(H, currentState)
    % find the probabilities of reaching all states starting at the current one:
    probVector = H(:,currentState)'; % probVector is a row vector
    n = length(probVector); %n is the number of states
    % generate the next state randomly according to probabilities probVector:
    state = discrete_rnd(1:n, probVector);
end

% Generate randomly the next state.
% Inputs:
% states = vector with state values
% probVector = probability vector
function state = discrete_rnd(states, probVector)
    U=rand();
    i = 1 + sum(U > cumsum(probVector));
    state= states(i);
end
