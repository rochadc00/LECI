clc
clear all
%% a)

    %a  %m  %o  %r  %.
T= [0   0.5 0   0.5 0
    1/4 0   1/3 0   0
    1/4 0.5 0   0.5 0
    1/4 0   1/3 0   0
    1/4 0   1/3 0   0];

set_of_letters = 'amor';
state = crawl(T, randi(4), 5);
state = state(1:length(state)-1);
word = set_of_letters(state);

fprintf('A palavra gerada foi: %s\n', word);

%utiliza o crawl a partir de um random dos 4 estados até ao 5º estado
%Como o set of letters só tem 4 letras, temos que retirar o ultimo estado
%(que é o ponto)
%word são as letras dos estados percorridos


%% b)

N = 1e5;
lista = {};
state = crawl(T, randi(4), 5);
state = state(1:length(state)-1);
word = set_of_letters(state);
lista{1}= word;
cont{1} = 1;

for n=2:N
    state = crawl(T, randi(4), 5);
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

[something,i] = sort(cell2mat(prob),'descend');

% cell2mat passa as palavras para numeros de forma descendente pelo sort

for j = 1:5
    fprintf('A %d ª palavra mais provavel é " %s " e o seu valor de probabilidade é: %f \n',j, lista{i(j)}, prob{i(j)} );
end

    fprintf('Numero de palavras unicas geradas: %d\n',length(lista));

%geramos uma palavra e associamos-lhe um contador
%dentro de um ciclo geramos outras 99,999 palavras verificando se essa
%palavra já existe na lista ou não.
%se a palavra não existe, adicionamos a palavra nova à lista e associamos o contador 
%se a palavra existe, simplesmente acrescentamos 1 ao contador
%contador conta o numero de vezes que a palavra foi gerada.

%% c)


%% d)

fid= fopen('wordlist-preao-20201103.txt','r');
dicionario= textscan(fid,'%s');
fclose(fid);
dicionario= dicionario{1,1};

soma = 0;
for i = 1:length(lista)
     a= ismember(lista{i},dicionario); %returns an array of booleans
     pos= find(a==true);               %return the position(s) of the true
     if ~isempty(pos)
       soma = soma + prob{i};
     end
end

    fprintf('Probabilidade de gerar uma palavra portuguesa valida: %f\n',soma);

% criar um cell array com as palavras do ficheiro do site
% probabilidade de uma palavra acontecer
% se a palavra existir na lista, a sua probabilidade aumenta 
%pois ocorreu mais uma vez 
    

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
