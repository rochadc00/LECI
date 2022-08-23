dic = readcell('u_item.txt');
users = readcell('u.data.txt');
N = size(users);
Ndic=size(dic);


k = 100;
            minHashString = [k, length(filmes)];
            p = 2^16;
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
                     vetorhash = [vetorhash varT];
                  end
                  minHashString(i,j) = min(vetorhash);
               end
            end