%%%alinea a)%%%%
%%% i)
clc
clear
N=1e5;
experiencias = rand(5,N)<=0.3;

num = sum(experiencias);

X = 0:5;
fX = zeros(1,6);

for i = X
    fX(i+1) = sum(num==i)/N;
end

%%% ii)
stem(X,fX)
axis([-1 6 0 0.4])
grid on


%%% iii)
fprintf('Probabilidade de, no máximo, 2 das peças de uma amostra serem defeituosas = %f\n',sum(fX(1:3)))


%%%%%%%%%alinea b%%%%%%%%%%%%
%%%% i)
X = 0:5;
fX = zeros(1,6);

for i = X
    fX(i+1) = nchoosek(5,i)*0.3^(5-i)*0.3^(i);
end

figure(2)
stem(X,fX)
axis([-1 6 0 0.4])
grid on

%%% ii)
fprintf('Probabilidade de, no máximo, 2 das peças de uma amostra serem defeituosas = %f\n',sum(fX(1:3)))
