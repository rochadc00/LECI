fxxxxxx(1);
fxxxxxx(1,8);

function [asin_T,asin_M] = fxxxxxx(X,N)
    if (nargin == 1) %se só receber o X, N = 8 por defeito
       N = 8;
    end
    x = pi/3;
    y = zeros(1,N);
    for i = 0:N
        y(i+1) = (-1)^i*x^(2*i+1)/factorial(2*i+1); 
    end
    asin_T = sum(y) %calculado atraves da serie
    
    
    sysm = x;
    f = exp(-x);
    asin_M = taylor(f); %calculado atraves da função do matlab
    
end
