#encoding: utf8
#Diana Rocha 98524
#conversou com: Joana Cunha 98189

from semantic_network import *
from bayes_net import *
from collections import Counter
#from itertools import product


class MySemNet(SemanticNetwork):
    def __init__(self):
        SemanticNetwork.__init__(self)
        # IMPLEMENT HERE (if needed)

    def source_confidence(self,user):
        # IMPLEMENT HERE
        lUserRelation = [d for d in self.declarations if d.user == user and isinstance(d.relation, AssocOne)]
        correct = 0
        wrong = 0

        for x in lUserRelation:
            list=[]
            for y in self.declarations:
                if x.relation.entity1 == y.relation.entity1 and x.relation.name == y.relation.name:
                    list.append(y.relation.entity2)
                   
            c = Counter(list)
            MostCommonWord = c.most_common(1)
            # print(MostCommonWord) list w/tuples
            # print("First arg: word that most appears \nSecond arg: num times that the word appears",MostCommonWord)


            searchWord = MostCommonWord[0] # gives u a tuple
            #print(searchWord)

            # if the second arg is one, it means that no word appears more than
            # one time, so the prob of each word is the same => all of them are correct
            if searchWord[1] == 1:
                correct += 1
            else:
                # the second arg is >1, so it means that we have a word that appears more than
                # one time => this word is the most common and the only correct
                #
                # if the most common word is equal to the word of the entity2(of this specific user)
                # than we add one more to the correct words
                if searchWord[0] == x.relation.entity2:
                    correct += 1
                else:
                    wrong += 1

        return (1-(0.75**correct))*(0.75**wrong)
        
    def query_with_confidence(self,entity,assoc):
        # IMPLEMENT HERE
        ldecl = self.query_local(e1 = entity, relname=assoc)

        lparents = [d.relation.entity2 for d in self.query_local(e1 = entity, relname = "subtype") + self.query_local(e1 = entity, relname = "member")]
        lRelation = [d.relation.entity2 for d in ldecl if isinstance(d.relation, AssocOne) or isinstance(d.relation,AssocSome)]

        #Compute the number of occurrences, n, for each alternative value (i.e. second argu-
        #ment) of assoc in entity. Compute also the total number of declarations of assoc
        #in entity, T
        T = len(lRelation)
        cnt = Counter(lRelation)
    
        local = {}
        for x in lRelation:
            n = cnt.get(x)
             # Compute the confidence in each value as follows:
            conf = (n/(2*T)) + (1-(n/(2*T)))*(1-pow(0.95, n))*pow(0.95, T-n)
            local[x] = conf

        #Call the method recursivelly for all parent entities
        #average the confidence results
        parents = {}
        for p in lparents:
            prob = self.query_with_confidence(p, assoc)

            for ldecl in prob:
                if ldecl not in parents:
                    parents[ldecl] = prob[ldecl]
                else:
                    parents[ldecl] += prob[ldecl]

        parents = { i:parents[i]/len(lparents) for i in parents }


        #If there are no local results, the inherited results should be returned with a discount
        #of 10%
        if not local:
            parents = {j:parents[j]*0.9 for j in parents}
            return parents

        #n all other cases, the final confidence values are computed by weighted average, with  
        #0.9 for the local confidences and 0.1 for the inherited confidences.
        keys = []
        keys.extend(local.keys())
        keys.extend(parents.keys())
        keys = set(keys)

        # without inherited results, we need to return the local results
        if not parents:
           return local

        for key in keys:
            v = 0
            if key in local and key in parents:
                v += local[key]*0.9
                v += parents[key]*0.1
            elif key in local:
                v += local[key]*0.9
            elif key in parents:
                v += parents[key]*0.1
            local[key]=v

        return local

class MyBN(BayesNet):

    def __init__(self):
        BayesNet.__init__(self)
        # IMPLEMENT HERE (if needed)
        pass

    def individual_probabilities(self):
        # IMPLEMENT HERE
        
        all_conjunctions = self._gen_conjunctions(list(self.dependencies.keys())) 
        reserve = self.dependencies.keys()

        dictionary={}
        for x in reserve:
            dictionary[x] = sum([self.jointProb(c) for c in all_conjunctions if (x,True) in c])

        return dictionary

    # function added 
    def _gen_conjunctions(self, var):
        if len(var) == 1:
            return [[(var[0], True)], [(var[0], False)]]

        take = []
        for c in self._gen_conjunctions(var[1:]):
            take.append(c + [(var[0], True)])
            take.append(c + [(var[0], False)])

        return take
