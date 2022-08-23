clear
clc
P_bug = 0.01*20/100 + 0.05*30/100 + 0.001*50/100;
P_carlos_bug = 0.001*50/100/P_bug
%P_bruno_bug = 0.05*30/100/P_bug
%P_andre_bug = 0.01*20/100/P_bug

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Por simulação:
tic
N = 1e7;
experiencias = [rand(20,N)<0.01;rand(30,N)<0.05;rand(50,N)<0.001];

contAB = 0;
contB = 0;
for i=1:N 
    aux = randi(100);
    if experiencias(aux,i)==true
        contB = contB+1;
        if aux>50
            contAB = contAB+1;
        end
    end
end

P_Carlos_erro_sim = contAB/contB
toc


%%%%%%Outra versão%%%%%%%
tic
contAB_2 = 0;
contB_2 = 0;
for k=1:N
   aux = randi(100);
   if aux>50
       a=rand()<0.001;
   elseif aux<=20
       a=rand()<0.01;
   else
       a=rand()<0.05;
   end
   if a==true
       contB_2 = contB_2+1;
       if aux>50
           contAB_2=contAB_2+1;
       end
   end
end
P_Carlos_erro_sim_2 = contAB_2/contB_2
toc
