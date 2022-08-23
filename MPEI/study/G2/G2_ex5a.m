clc
p = 1/6;
faces = 6;
lancamentos = 2;
N = 1e5;


tentativas = randi(faces,lancamentos,N);

%soma dos dois valores é igual a 9
a = sum(tentativas) == 9; 
probA = sum(a)/N


%segundo valor é par
b = rem(tentativas(2,:),2)==0;
probB = sum(b)/N 


%pelo menos um dos valores é 5
c1 = tentativas(1,:) == 5;
c2 = tentativas(2,:) == 5;
probC = sum(c1 | c2)/N 


%nenhum dos valores é 1
d1 = tentativas(1,:) ~= 1;
d2 = tentativas(2,:) ~= 1;
probD = sum(d1 & d2)/N
