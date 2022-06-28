clear all
% 1
%% a

% 1 -> não ir à aula
% 2 -> ir à aula

T = [0.2 0.3
     0.8 0.7];
sum(T)

x= [0
    1];
%x1 = T*x;
x2 = T^2*x;
fprintf('1a) resposta = %f\n',x2(2));
%resp = x2(2);

%% b)

x= [1
    0];
%x1 = T*x;
x2 = T^2*x;
fprintf('1b) resposta = %f\n',x2(2));

%% c)
x= [0
    1];
x2 = T^29*x;
%%30 Aulas -1 = 29
fprintf('1c) resposta = %f\n',x2(2));

%% d)
x =  [0.15
      0.85];
res = zeros(1,30);
res(1)=0.15;
for i = 2:30
   x = T*x;
   res(i) = x(1);
end

plot(res,'*-')