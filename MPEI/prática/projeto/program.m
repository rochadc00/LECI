dic = readcell('u_item.txt');
users = readcell('u.data.txt');
N = size(users);
Ndic=size(dic);


         % Código base para deteção de pares similares

        udata=load('u.data.txt');  % Carrega o ficheiro dos dados dos filmes

        % Fica apenas com as duas primeiras colunas
        u= udata(1:end,1:2);
        clear udata.txt;

        % Lista de utilizadores
        users2 = unique(u(:,1));   % Extrai os IDs dos utilizadores
        Nu= length(users2);        % Número de utilizadores

        % Constrói a lista de filmes para cada utilizador
        Set= cell(Nu,1); 

        for n = 1:Nu % Para cada utilizador
            % Obtém os filmes de cada um
            ind = find(u(:,1) == users2(n));

            % E guarda num array. Usa células porque utilizador tem um nu´mero
            % diferente de filmes. Se fossem iguais podia ser um array
            Set{n} = [Set{n} u(ind,2)];
        end

        %MinHashValue-> calculo da minhash para achar user mais identico com o USERID 
         
         K = 50;
            MinHashValue = inf(Nu,K);
            for i = 1:Nu
                conjunto = Set{i};
                for j = 1:length(conjunto)
                    chave = char(conjunto(j));
                    hash = zeros(1,K);
                    for kk = 1:K
                        chave = [chave num2str(kk)];
                        hash(kk) = DJB31MA(chave,127);
                    end
                    MinHashValue(i,:) = min([MinHashValue(i,:);hash]);
                end
            end

        save 'material.mat' dic users N Nu Ndic Set MinHashValue K Set;