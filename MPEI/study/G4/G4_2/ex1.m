clc
clear all

%% import list of words to a cell array 'dicionario':
fid= fopen('wordlist-preao-20201103.txt','r');
dicionario= textscan(fid,'%s');
fclose(fid);
dicionario= dicionario{1,1};

%% ex1
n = 8000;
m = 1000;
m2 = 10000;
k = 3;
BF = inicializar(n);
for i = 1:m
    BF = inserir(dicionario{i},BF,k);
end

%% ex2
contador = 0;
for i = 1:m
    check = verificar(dicionario{i},BF,k);
    if ~check
        contador = contador + 1;
    end
end
fprintf('Numero de falsos negativos = %d\n',contador);

%% ex3 & ex 4

contador = 0;
for i = m+1:m+m2
    check = verificar(dicionario{i},BF,k);
    if check
        contador = contador + 1;
    end
end
fprintf('Percentagem de falsos positivos = %.2f%%\n',100*contador/m2);
fprintf('Percentagem de falsos positivos teórica = %.2f%%\n', 100*(1-exp(-k*m/n))^k);



%% functions
function BF = inicializar(n)
    BF = false(1,n);
    %booleano ocupa um 1bit
end

function BF = inserir(elemento,BF,k)
    n = length(BF);
    for i=1:k
        elemento = [elemento num2str(i)];
        h = DJB31MA(elemento,127);
        h = mod(h,n)+1;
        BF(h) = true;
    end
end

function check = verificar(elemento,BF,k)
    n = length(BF);
    check = true;
    for i=1:k
        elemento = [elemento num2str(i)];
        h = DJB31MA(elemento,127);
        h = mod(h,n)+1;
        if ~BF(h)
            check = false;
            break;
        end    
    end
end