udata=load('u.data.txt');
u = udata(1:end,1:2);
clear udata;
users = unique(u(:,1));
Nu=length(users);
Set = cell(Nu,1);
for n = 1:Nu
    ind = find (u(:,1)==users(n));
    Set{n} = [Set{n} u(ind,2)];
end
K = 50;
MinHashValues = inf(Nu,K);
for i=1:Nu
    i
   movies = Set{i};
   for j=1:length(movies)
      hash = zeros(1,K);
      key = char(movies(j));
      for kk=1:K
         key = [key num2str(kk)];
         hash(kk) = DJB31MA(key,127);
      end
      MinHashValues(1,:)=min([MinHashValues(1,:);hash]);
   end
end
fprintf('Computing MinHashes= %f\n', toc);
tic
J=zeros(Nu); % matriz 
h=waitbar(0,'Calculating');
for n1 = 1:Nu
    waitbar(n1/Nu,h);
    for n2=n1+1:Nu
%         I=intersect(Set{n1}, Set{n2}); % valores intersetados, interseção (matematica)
%         U=union(Set{n1},Set{n2} ); % valores reunidos, reuniao (matematica)
%         J(n1,n2)=1-length(I)/length(U); % 1- (numero de itens da interseçao / numero de itens da reuniao)
          J(n1,n2)=sum(MinHashValues(n1,:)~=MinHashValues(n2,:))/K;
    end
end
delete(h)
fprintf('Tempo de calculo das distancias aproximadas =%f\n',toc);
save 'J.mat' J
tic
threshold=0.4;
SimilarUsers=zeros(1,3);
k=1;
for n1=1:Nu
    for n2 = n1+1:Nu
        if J(n1,n2)<=threshold
            SimilarUsers(k,:)=[users(n1) users(n2) J(n1,n2)];
            k=k+1;
        end
    end
end
fprintf('tempo de calculo dos utilizadores mais similares = %f\n', toc);
fprintf('No. de pares mais similares = %d\n', size(SimilarUsers,1));
SimilarUsers