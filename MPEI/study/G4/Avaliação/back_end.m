clear all
clc
%% Processamento dos ficheiros
% Carrega o ficheiro do nome dos filmes e os seus géneros
%e guarda-o num cell array
uitem = readcell('u_item.txt');

% Carrega o ficheiro dos dados dos filmes
udata=load('u.data');
% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:2);
clear udata;


%% Código base para deteção de pares similares

% Lista de utilizadores
users = unique(u(:,1));     % Extrai os IDs dos utilizadores
N= length(users);          % Número de utilizadores

% Constrói a lista de filmes para cada utilizador
Set= cell(N,1);

for n = 1:N                % Para cada utilizador
    % Obtém os filmes de cada um
    ind = find(u(:,1) == users(n));

    % E guarda num array. Usa células porque utilizador tem um número
    % diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,2)];
end


%% MinHash for option 2
K = 50; % experimentar 25-200 (de 25 em 25) !!!!!!!!! (numero de funções de hash)
MinHashValue1 = inf(N,K);
for i = 1:N
    conjunto = Set{i};
    for j = 1:length(conjunto)
        chave = char(conjunto(j));
        hash = zeros(1,K);
        for kk = 1:K
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave,127);
        end
        MinHashValue1(i,:) = min([MinHashValue1(i,:);hash]);
    end
end

%% Calcula a distância de Jaccard entre todos os pares pela definição.
J1=ones(N); % array para guardar distâncias

for n1= 1:N
    for n2= n1+1:N
        if (n1~=n2)
            J1(n1,n2) = sum(MinHashValue1(n1,:)~=MinHashValue1(n2,:))/K;
        end
    end
end

%% MinHash for option 3

movies = [];
% Obter um array apenas com os titulos
for i = 1:length(uitem)    
    movies = [movies,string(uitem{i})];
end

K = 100; % experimentar 50-200 (de 25 em 25) !!!!!!!!! (numero de funções de hash) (provavelmente 150)
MinHashValue2 = inf(length(movies),K);

for i = 1:length(movies)                                
    shingle = {};
    for j = 1:strlength(movies(i))-1                            % se o shingle for de 3, meter
        temporary = char(extractBetween(movies(i), j, j+1));    %strlength(...)-2 e j = j+2)
        shingle{end+1} = lower(temporary);
    end
    for j = 1:length(shingle)
        chave = shingle{j};
        hash = zeros(1,K);
        for kk = 1:K
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave,127);
        end
        MinHashValue2(i,:) = min([MinHashValue2(i,:);hash]);
    end
end

%% Guarda as variaveis necessárias num ficheiro para ser utilizado nas funções do front_end
save back_end uitem Set J1 MinHashValue2 movies;
