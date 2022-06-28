p = 0.5;
k = 1;
k_2 = 2;
n = 2;
prob = nchoosek(n,k)*p^k*(1-p)^(n-k)+ nchoosek(n,k_2)*p^k_2*(1-p)^(n-k_2)

% Como os casos possiveis são ter Rapaz+Rapaz, 
%Rapaz+Rapariga, 
%Rapariga+Rapaz,
%Rapariga+Rapariga.
%Existem 4 casos possiveis,
%sendo 3 deles favoraveis.
%Logo 3/4 dos casos = 0,75.