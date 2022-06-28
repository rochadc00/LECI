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
         
          K = 100;
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
          %Minhash utilizada para achar string identica a lida do keyboard
          %filmes - > lista de filmes  
          
          filmes = [];
            for i = 1:length(dic)
                filmes = [filmes, string(dic{i,1})];
            end
          
          k = 100;
            minHashString = [k, length(filmes)];
            p = 2^12;
            a=randi([2,p-1], k, 1);
            b=randi([2,p-2], k, 1);

            for i = 1:k
               for j = 1:length(filmes)
                  vetorhash = [];
                  shingles = {};
                  titulos = filmes(j);
                  for Y = 1:strlength(titulos)-1
                      varT = char(extractBetween(titulos, Y, Y+1));
                      shingles{end+1} = varT;
                  end
                  for Y = 1:length(shingles)
                     hash = hashstring(shingles{Y}, p);
                     temp = mod(a(i)*hash+b(i),p);
                     vetorhash = [vetorhash temp];
                  end
                  minHashString(i,j) = min(vetorhash);
               end
            end

         

        save 'material.mat' dic users N Nu Ndic Set MinHashValue a b filmes minHashString K Set;