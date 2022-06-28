%Sabemos que o primeiro filho é rapaz, logo temos
% as seguintes possibilidades:
% Rapaz + rapariga ou Rapaz + Rapaz
% 1 deles é favoravel, outro não.
% Logo, o valor teorico, é 0.5
N = 1e5;
n = 2;
p = 0.5;


a1 = sum(a)>=2;
a2 = a(1,:);

prob = sum(a1 & a2)/sum(a2)