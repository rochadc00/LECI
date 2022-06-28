clc
clear all;
load 'material.mat'
%userID -> input
userID = -1;
while(userID == -1)
    userID = input('Insert User ID (1 to 943): ');
    if(userID >943 || userID <1)
        userID = -1;
        disp('ID must be between 1 and 943');
        disp(' ');
    end
end


x=1;
while (x==1) 
disp('|-------------------|');
disp('|   ONLINE MOVIES   |');
disp('|-------------------|');
disp('|1 - Your Movies    |');
disp('|2 - Get Suggestions|');
disp('|3 - Search Title   |');
disp('|4 - Exit           |');
disp('|-------------------|');
op = input('Select choice: ');
    switch op
     case 1
        MoviesID = Set{userID,1};
        fprintf('\n Your Movies: \n');
        for i = 1:length(MoviesID)
            fprintf('%s\n',dic{MoviesID(i),1});
        end
     case 2
              disp('|------------------------------------------------------------|');   
              disp('|                        CHOOSE A GENRE                      |');   
              disp('|------------------------------------------------------------|');
              disp('| 1- Action    2- Adventure   3- Animation,   4- Children’s  |');
              disp('| 5- Comedy    6- Crime       7- Documentary, 8- Drama       |');
              disp('| 9- Fantasy   10- Film-Noir  11- Horror      12- Musical    |');
              disp('| 13- Mystery  14- Romance    15- Sci-Fi      16- Thriller   |');
              disp('| 17- War      18- Western                                   |');
              disp('|------------------------------------------------------------|');
              Preference = input('                      Pick your preference(1-18): ');
              if(Preference < 18 || Preference > 1)
                    Similaridade = Calc_dist(Nu,userID,MinHashValue,K);
                    [val,ID] = max(Similaridade);
                    ID
                    u1 = Set{userID,1};
                    u2 = Set{ID,1};
                    A = setdiff(u1,u2);
                    length(intersect(u1,u2))
                    sim = length(intersect(u1,u2));
                    FinalMovies = Sugestao(u1,u2,Preference , dic);
                    if(~isempty(FinalMovies))
                    fprintf('Some recomended movies: \n')    
                    fprintf('%s\n', FinalMovies);
                    else
                    fprintf('Cant recommend you a movie \n');
                    end
              else
                  clc();
              end
     case 3
         Searcher = input('Write a String: \n','s');
         Sugerindo = SugestaoFilmes(Searcher, minHashString, filmes, a, b);
         if(isempty(Sugerindo))
                fprintf('Não foram encontradas sugestões de filmes com base na pesquisa');
         else
            for i = 1:length(Sugerindo)
                    fprintf('"%s";\n', Sugerindo(i));
            end
         end
     case 4
        x=0;
        break;
     otherwise
        disp('Choose a valid option')
        x=1;
        disp('1 - Your Movies');
        disp('2 - Get Suggestions');
        disp('3 - Search Title');
        disp('4 - Exit');
        op = input('Select choice: \n');
    end
end

%Funcao calcular distancia
function [Vetor_distancia]=Calc_dist(Nu,userID,MinHashValue,K)

            % Calcula a distancia de Jaccard entre todos os pares pela definicão.
            Vetor_distancia=zeros(1,Nu); % array para guardar distâncias
            h= waitbar(0,'Calculating');

            for n1= 1:Nu            % 1:number(users)
                waitbar(n1/Nu,h);
            %        I = intersect(Set{n1},Set{n2});
            %        U = union(Set{n1},Set{n2});
            %        Vetor_distancia(n1,n2) = 1 - length(I)/length(U);
               if n1 ~= userID 
                    Vetor_distancia(n1) = sum(MinHashValue(n1,:)==MinHashValue(userID,:))/K;
               end
            end
            delete(h);
end
function [Por_ver] = Sugestao(u1,u2,genero , dic)
    preference = genero+1;
    Por_ver = [];
    for i = 1:length(u2)
        g = dic{u2(i),preference};
        if(~ismember(u2(i),u1) && g(1)==1)
            Por_ver = [Por_ver, string(dic{u2(i),1})];
        end
    end
end
function [Sugestoes, valores] = SugestaoFilmes(Searcher, minHashString, filmes, a, b)
    k = 100;
    p = 2^12;
    shingles = {};
    for i = 1:length(Searcher)-1
       VarT = char(extractBetween(Searcher, i, i+1));
       shingles{end+1} = VarT;
    end

    hash = zeros(k,1);
    similares = [];
    for i = 1:k
        VarAx = [];
        for j = 1:length(shingles)
            VarT = hashstring(shingles{j},p);
            valor = mod(a(i)*VarT+b(i),p);
            VarAx = [VarAx valor];
        end
        hash(i) = min(VarAx);
    end
    for i = 1:length(filmes)
        sum(hash==minHashString(:,i))
        similares(i) = sum(hash==minHashString(:,i))/length(hash);
    end

    [valores, ids] = maxk(similares,5);
    Sugestoes = [];
    for i = 1:5
        if(valores(i)>=0.01)
            Sugestoes = [Sugestoes, string(filmes(ids(i)))];
        end
    end
end