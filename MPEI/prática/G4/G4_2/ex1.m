clc
clear all

%% import list of words to a cell array 'dicionario':
fid= fopen('wordlist-preao-20201103.txt','r');
dicionario= textscan(fid,'%s');
fclose(fid);
dicionario= dicionario{1,1};
Nwords= length(dicionario)
dicionario{100}
dicionario{Nwords}

%% ex1,2,3,4,5
N = 1e6;
vetorB = false(1,N);
%booleano ocupa um 1bit
k = 3;
for i=1:k
    str = [str num2str(i)];
    h = DJB31MA(hash,m,str);
end