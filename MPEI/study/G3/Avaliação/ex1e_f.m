clc
clear all
%% e) & f)

size = 4;
%size = 6;
%size = 8;


    %a  %m  %o  %r  %.
T= [0   0.5 0   0.5 0
    1/4 0   1/3 0   0
    1/4 0.5 0   0.5 0
    1/4 0   1/3 0   0
    1/4 0   1/3 0   0];

set_of_letters = 'amor';
N = 1e5;
lista = {};
state = crawl(T, randi(4), 5, size);
state = state(1:length(state)-1);
word = set_of_letters(state);
lista{1}= word;
cont{1} = 1;

for n=2:N
    state = crawl(T, randi(4), 5, size);
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
    fprintf('Para n = %d ,a %d ª palavra mais provavel é " %s " e o seu valor de probabilidade é: %f \n',size, j, lista{i(j)}, prob{i(j)} );
end


fprintf('Numero de palavras unicas geradas para n=%d: %d\n',size, length(lista));

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
    
    fprintf('Probabilidade de gerar uma palavra portuguesa valida para size = %d é %f\n',size,soma);

%% crawl->

function state = crawl(H, first, last, tamanho)
    % the sequence of states will be saved in the vector "state"
    % initially, the vector contains only the initial state:
    state = [first];
    % keep moving from state to state until state "last" is reached:
    while (1)
        state(end+1) = nextState(H, state(end));
        if (state(end) == last || length(state) == tamanho)
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
