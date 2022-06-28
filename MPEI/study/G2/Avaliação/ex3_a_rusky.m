
N = 1e5; % n experiencias
brinquedos = 8;

% função massa probabilidade de x
nmrBrin = sum(rand(brinquedos, N) < 0.5);
fmp_x = histc(nmrBrin, 0:8) / N;

% gráfico da fmp_x
stem(0:brinquedos, fmp_x);
grid on;
xlabel('X Value (xi)');
ylabel('P(X = xi)');
title('Estimated Probability Mass Function (PMF) of Random Variable X');
