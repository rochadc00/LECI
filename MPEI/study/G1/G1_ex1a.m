experiencias = rand(3,10000);
lancamentos = experiencias > 0.5;
resultados = sum(lancamentos);
sucessos = resultados==2;
probSimulacao = sum(sucessos)/10000