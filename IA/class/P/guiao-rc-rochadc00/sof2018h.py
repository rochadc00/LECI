from bayes_net import *

bn = BayesNet()

variables = ['sc', 'pt', 'cp', 'fr', 'pa', 'cnl']
#- CP = cara preocupada
#- FR = frequencia de utilização de rato
#- PA = precisa de ajuda
#- CNL = correio eletrónico não lido
#- SC = sobrecarga de trabalho (Independente)
#- PT = está a utilzar o processador de texto (Indepdente)


#bn.add(None, [], 0)
bn.add('sc',[],0.6)
bn.add('pt',[],0.05)

bn.add('pa',[('pt',True )],0.25)
bn.add('pa',[('pt',False)],0.004)

bn.add('fr',[('pt',True ),('pa',True )],0.90)
bn.add('fr',[('pt',True ),('pa',False)],0.90)
bn.add('fr',[('pt',False),('pa',True )],0.10)
bn.add('fr',[('pt',False),('pa',False)],0.01)

bn.add('cnl',[('sc',True )],0.90)
bn.add('cnl',[('sc',False)],0.001)

bn.add('cp',[('sc',True ),('pa',True )],0.02)
bn.add('cp',[('sc',True ),('pa',False)],0.01)
bn.add('cp',[('sc',False),('pa',True )],0.011)
bn.add('cp',[('sc',False),('pa',False)],0.001)


