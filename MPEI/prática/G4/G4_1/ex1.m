clc
clear all
%% a)
N = 1e5;
alpha = ['a':'z' 'A':'Z'];
tic
keys = generator(N,6,20,alpha);
fprintf('1a) No. keys: %d\n', length(keys));
fprintf('    No. unique: %d\n', length(unique(keys)));
fprintf('    Running time: %f seconds\n', toc);
save 'keys' 'keys'
%% b)
N = 1e5;
alpha = ['a':'z'];
tic
probs = load('prob_pt.txt');
keysB = generator(N,6,20,alpha,probs);
fprintf('1b) No. keysB: %d\n', length(keysB));
fprintf('    No. unique: %d\n', length(unique(keysB)));
fprintf('    Running time: %f seconds\n', toc);
save 'keysB' 'keysB'

%% func
function keysB = generator(N,imin,imax,alpha,probs)
    keysB={};
    n = 0;
    Nalpha = length(alpha);
    if nargin == 5
        cs = cumsum(probs); %soma comulativa 
    end
    while n<N
        tam = randi([imin imax]);
        if nargin==4
            aux = randi(Nalpha,1,tam);
        else
            aux = zeros(1,tam);
            rn = rand(1,tam);
            for i = 1:tam
                aux(i) = 1 + sum(rn(i)>cs);
            end
        end
        keyB = alpha(aux);
        if ~ismember(keyB,keysB)
            n = n + 1;
            keysB{n} = keyB;
        end
    end
end