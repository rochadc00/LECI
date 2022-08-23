N = 1e5;
n = 5;

a = rand(n,N) > 0.5;
a1 = sum(a) >= 1;
a2 = sum(a) >= 2;

prob = sum(a2)/sum(a1) 