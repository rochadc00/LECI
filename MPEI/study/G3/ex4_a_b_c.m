clear all
%4
%% a)
    p = 0.4;
    q = 0.6;
    T = [p^2 (1-p)^2 p*(1-p) p*(1-p)
         0   0       0       1
         0   0       0       1
         q^2 q*(1-q) q*(1-q) (1-q)^2]'
     
%% b)
    v = [1
         0
         0
         0];
    
    fprintf('5 iter:\n p(A)=%.8f\n p(B)=%.8f\n p(C)%.8f\n p(D)%.8f\n',T^5*v)
    fprintf('10 iter:\n p(A)=%.8f\n p(B)=%.8f\n p(C)%.8f\n p(D)%.8f\n',T^10*v)
    fprintf('100 iter:\n p(A)=%.8f\n p(B)=%.8f\n p(C)%.8f\n p(D)%.8f\n',T^100*v)
    fprintf('200 iter:\n p(A)=%.8f\n p(B)=%.8f\n p(C)%.8f\n p(D)%.8f\n',T^200*v)
    
%% c)
    M = [T - eye(4)
         ones(1,4)];
    X = [zeros(4,1)
         1];
    v = M\X;
    fprintf('Probs. limite:\n A=%.8f\n B=%.8f\n C=%.8f\n D=%.8f\n',v);
