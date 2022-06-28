%ex3
clc
clear
N=1e5;
experiencias = rand(4,N)<=0.5;
%experiencias = randi([0,1],4,N);

num = sum(experiencias);

X = 0:4;
fX = zeros(1,5);

for i = X
    fX(i+1) = sum(num==i)/N;
end

stem(X,fX)
axis([-1 5 0 0.4])
grid on

media = sum(fX.*X)
variancia = sum(fX.*(X.^2)) - media^2
desvioPadrao = sqrt(variancia)
%desvioPadrao = variancia^0.5


%%%%%%%%%alinea d%%%%%%%%%%%%
X = 0:4;
fX = zeros(1,5);

for i = X
    fX(i+1) = nchoosek(4,i)*0.5^(4-i)*0.5^(i);
    %fX(i+1) = nchoosek(4,i)*0.5^4;
end

figure(2)
stem(X,fX)
axis([-1 5 0 0.4])
grid on

%%%%%%aline e)%%%%%%%%%%%%5
media = sum(fX.*X)
variancia = sum(fX.*(X.^2))- media^2

%%%%%%alinea f)%%%%%%%%5
%%% i)
fprintf('Probabilidade de obter pelo menos 2 coroas = %f\n',sum(fX(3:5)));

%%% ii)
fprintf('Probabilidade de obter até 1 coroa = %f\n',sum(fX(1:2)))

%%% iii)
fprintf('Probabilidade de obter entre 1 e 3 coroas = %f\n',sum(fX(2:4)))

