clear all
%5
%% a)
    T = [0.7 0.2 0.3
         0.2 0.3 0.3
         0.1 0.5 0.4]
%% b)
    %P(solPrimDia)*P(sol->sol)*P(sol->sol)
    res_b = 1 * T(1,1) * T(1,1);
    fprintf('5b) respostas:\n%f\n',res_b);
%% c)
    %P(sol)*(P(sol->sol) + P(sol->nuvens))*...
    v = [1
         0
         0];
     v2 = T*v;
     w = v2/(v2(1)+v2(2));
     v3 = T*w;
     res_c = v(1) * (v2(1)+v2(2)) * (v3(1)+v3(2));
     fprintf('5c) respostas:\n%f\n',res_c);
%% d)
    v=[1
       0
       0];
   cont_sol = v(1);
   cont_nuvens = v(2);
   cont_chuva = v(3);
   for i = 2:31
    v = T*v;
    cont_sol = cont_sol + v(1);
    cont_nuvens = cont_nuvens + v(2);
    cont_chuva = cont_chuva + v(3);
   end
   [cont_sol cont_nuvens cont_chuva]
%% e)
    v=[0
       0
       1];
   cont_sol = v(1);
   cont_nuvens = v(2);
   cont_chuva = v(3);
   for i = 2:31
    v = T*v;
    cont_sol = cont_sol + v(1);
    cont_nuvens = cont_nuvens + v(2);
    cont_chuva = cont_chuva + v(3);
   end
   [cont_sol cont_nuvens cont_chuva]

%% f)
    v=[1
       0
       0];
   cont1 = 0.1*v(1) + 0.3*v(2) + 0.5*v(3);

   for i = 2:31
    v = T*v;
    cont1 = cont1 + 0.1*v(1) + 0.3*v(2) + 0.5*v(3);
   end
   
   
    v=[0
       0
       1];
   cont2 = 0.1*v(1) + 0.3*v(2) + 0.5*v(3);

   for i = 2:31
    v = T*v;
    cont2 = cont2 + 0.1*v(1) + 0.3*v(2) + 0.5*v(3);
   end
   
   [cont1 cont2]