%% b)
% Com base em pX(x), calcule a probabilidade de X >= 2.
probMaiorIgualDois = 1;
for i=0:1
    probMaiorIgualDois = probMaiorIgualDois - nchoosek(8, i)*((1/2)^8);
end

fprintf('P(X>=2): %f\n', probMaiorIgualDois);

%% c)
% Com base em pX(x), estime o valor esperado, a variância e o desvio padrão
% de X.

valores_x = 0:brinquedos;

esperado = sum(valores_x.*fmp_x);
variancia = sum(valores_x.^2.*fmp_x) - esperado^2;
desvio_padrao = sqrt(variancia);

fprintf('X Valor esperado: %.3f\n', esperado);
fprintf('X Variância: %.3f\n', variancia);
fprintf('X Desvio Padrão: %.3f\n', desvio_padrao);