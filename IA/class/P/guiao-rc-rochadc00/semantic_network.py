

# Guiao de representacao do conhecimento
# -- Redes semanticas
# 
# Inteligencia Artificial & Introducao a Inteligencia Artificial
# DETI / UA
#
# (c) Luis Seabra Lopes, 2012-2020
# v1.9 - 2019/10/20
#


# Classe Relation, com as seguintes classes derivadas:
#     - Association - uma associacao generica entre duas entidades
#     - Subtype     - uma relacao de subtipo entre dois tipos
#     - Member      - uma relacao de pertenca de uma instancia a um tipo
#

# testar o programa usando os comandos:
# pyhton3
# from sn_example import *
# z.list()

from collections import Counter


class Relation:
    def __init__(self,e1,rel,e2):
        self.entity1 = e1
#        self.relation = rel  # obsoleto
        self.name = rel
        self.entity2 = e2
    def __str__(self):
        return self.name + "(" + str(self.entity1) + "," + \
               str(self.entity2) + ")"
    def __repr__(self):
        return str(self)


# Subclasse Association
class Association(Relation):
    def __init__(self,e1,assoc,e2):
        Relation.__init__(self,e1,assoc,e2)

# Subclasse AssocOne
class AssocOne(Relation):
    def __init__(self, e1, rel, e2):
        Relation.__init__(self, e1, rel, e2)

# Subclasse AssocNum
class AssocNum(Relation):
    def __init__(self, e1, rel, e2):
        Relation.__init__(self, e1, rel, e2)

#   Exemplo:
#   a = Association('socrates','professor','filosofia')

# Subclasse Subtype
class Subtype(Relation):
    def __init__(self,sub,super):
        Relation.__init__(self,sub,"subtype",super)


#   Exemplo:
#   s = Subtype('homem','mamifero')

# Subclasse Member
class Member(Relation):
    def __init__(self,obj,type):
        Relation.__init__(self,obj,"member",type)

#   Exemplo:
#   m = Member('socrates','homem')

# classe Declaration
# -- associa um utilizador a uma relacao por si inserida
#    na rede semantica
#
class Declaration:
    def __init__(self,user,rel):
        self.user = user
        self.relation = rel
    def __str__(self):
        return "decl("+str(self.user)+","+str(self.relation)+")"
    def __repr__(self):
        return str(self)

#   Exemplos:
#   da = Declaration('descartes',a)
#   ds = Declaration('darwin',s)
#   dm = Declaration('descartes',m)

# classe SemanticNetwork
# -- composta por um conjunto de declaracoes
#    armazenado na forma de uma lista
#
class SemanticNetwork:
    def __init__(self,ldecl=None):
        self.declarations = [] if ldecl==None else ldecl
    def __str__(self):
        return str(self.declarations)
    def insert(self,decl):
        self.declarations.append(decl)
    def query_local(self,user=None,e1=None,rel=None,e2=None):
        self.query_result = \
            [ d for d in self.declarations
                if  (user == None or d.user==user)
                and (e1 == None or d.relation.entity1 == e1)
                and (rel == None or d.relation.name == rel)
                and (e2 == None or d.relation.entity2 == e2) ]
        return self.query_result
    def show_query_result(self):
        for d in self.query_result:
            print(str(d))

    # func ex.1
    def list_associations(self):
        lassoc = [ d.relation.name for d in self.declarations if isinstance(d.relation,Association) ]
        return list(set(lassoc))

    # func ex.2
    def list_objects(self):
        lobj = [ d.relation.entity1 for d in self.declarations if isinstance(d.relation, Member) ]
        return list(set(lobj))

    # func ex.3
    def list_member(self):
        lmember = [ d.user for d in self.declarations ]
        return list(set(lmember))

    # func ex.4
    def list_types(self):
        ltype = [d.relation.entity1 for d in self.declarations if isinstance(d.relation, Subtype) ] + [d.relation.entity2 for d in self.declarations if isinstance(d.relation, Subtype)
                 or isinstance(d.relation, Member)]
        return list(set(ltype))

    # func ex.5
    def list_declareName(self,entity):
        lnameDecl = [d.relation.name for d in self.declarations if d.relation.entity1 == entity and isinstance(d.relation,Association)]
        return list(set(lnameDecl))

    # func ex.6
    def list_declareRelation(self,user):
        luserRelation = [ d.relation.name for d in self.declarations if d.user == user and isinstance(d.relation, Association)]
        return list(set(luserRelation))

    # func ex.8
    def list_assoc(self, user):
        lOtherAssoc = [ d.relation.name for d in self.declarations if d.user != user and isinstance(d.relation, Association) ]
        return list(set(lOtherAssoc))

    # func ex.8
    def list_tuple(self,other_entity):
       AssocByName = [ (d.relation.name, d.user) for d in self.declarations if d.relation.entity1 == other_entity and isinstance(d.relation, Association)]
       return list(set(AssocByName))

    # func ex.9
    def predecessor(self,prd,dsc):
        ldecl = self.query_local(e1 = dsc)
        parents = [ d.relation.entity2 for d in ldecl if not isinstance(d.relation, Association)]

        if prd in parents:
            return True
        for p in parents:
            if self.predecessor(prd,p):
                return True

        return False

#    vertebrado
#         |
#         |st
#         |
#     mamifero
#         |
#         |st
#         |
#       homem  filosofo
#         |     /
#         |m   /m
#         |   /
#      socrates


    # func ex.10
    def predecessorPath(self,prd,dsc):
        ldecl = self.query_local(e1 = dsc)
        parents = [ d.relation.entity2 for d in ldecl if not isinstance(d.relation, Association)]

        if prd in parents:
            return [prd,dsc]
        for p in parents:
            path = self.predecessorPath(prd,p) 
            if path != None:
                return path + [dsc]

        return None

#   def predecessor(self,prd,dsc):
#         parents = [ d.relation.entity2 for d in self.query_local(e1=dsc) if not isinstance(d.relation, Association)]

#       for p in parents:
#           if prd == p or self.predecessor(prd,d):
#               return True
#        return False


    # func ex.11 a)
    def query(self,entity,assoc=None):
        ldecl = self.query_local(e1 = entity)
        parents = [ d.relation.entity2 for d in ldecl if not isinstance(d.relation, Association)]

#ex:    lparents = [ d.relation.entity2 for d in self.query_local(e1 = entity, rel = "subtype") + self.query_local(e1=entity, rel ="member")]

        lRelation = [ d for d in ldecl if isinstance(d.relation, Association) and (d.relation.name == assoc or assoc == None)  ]

        for p in parents:
            lRelation += self.query(p, assoc)
        return lRelation


    # func ex.11 b)
    def query2(self,entity,relation=None):
        queryResult = self.query(entity)

        ldecl = self.query_local(e1 = entity)
        lRelation = [ d for d in ldecl if isinstance(d.relation, Association) and (d.relation.name == relation or relation == None)  ]

        return queryResult + lRelation

    
    # func ex.12
    def query_cancel(self,entity, assoc=None):
        ldecl = self.query_local(e1 = entity)
       # parents = [ d.relation.entity2 for d in ldecl if not isinstance(d.relation, Association)]

        lRelation = [ d for d in ldecl if isinstance(d.relation, Association) and (d.relation.name == assoc) ]

        if lRelation == []:
            parents = [ d.relation.entity2 for d in ldecl if not isinstance(d.relation, Association)]

            for p in parents:
                lRelation += self.query_cancel(p, assoc)

      #  print(f'lRelation: {lRelation}')
        return lRelation

    # func ex.13  sem perceber o que faz ao certo
    def query_down(self,entity, assoc, child=True):
        ldecl = self.query_local(e2 = entity)
        lChildren = [ d.relation.entity2 for d in ldecl if not isinstance(d.relation, Association)]

        lRelation = []
        if not child:
            lRelation = [ d for d in self.query_local(e1=entity) if isinstance(d.relation, Association) and (d.relation.name == assoc)  ]

        for c in lChildren:
            lRelation += self.query_down(c, assoc, child=False)

        return lRelation


    # func ex.14
    def query_induce(self, entity, assoc):
        lRelation = self.query_down(entity,assoc)

        counter = {}
        for assoc in lRelation:
            if assoc.relation.entity2 not in counter:
                counter[assoc.relation.entity2] = 1
            else:
                counter[assoc.relation.entity2] += 1
        
        return max(counter,key=counter.get)

    # func ex.15

    def query_local_assoc(self,entity,relation):
        # consultar declarações locais de uma determinada entidade 
        local = self.query_local(e1=entity,rel=relation)

        if local == []:
            return []

        if isinstance(local[0].relation,AssocNum):
            return sum([l.relation.entity2 for l in local]) / len(local)
        
        #ex: z.query_local_assoc('socrates','pulsacao')
        # 56 = (51 + 61)/2

        elif isinstance(local[0].relation,AssocOne):
            c = Counter([l.relation.entity2 for l in local])

            # search the one most common value on entity2
            for c, count in c.most_common(1):
                return c, count/len(local) 

            # ex: z.query_local_assoc('socrates','pai')
            # ('sofronisco'(c), '0.67'(count(len(local))= 2/3))

        elif isinstance(local[0].relation, Association):
            c = Counter([l.relation.entity2 for l in local])

            l = []
            sumFinal = 0

            for v,count in c.most_common():
                l.append((v,count/len(local)))
                sumFinal += count/len(local)
                if sumFinal > 0.75:
                    break
            return l
    


# Funcao auxiliar para converter para cadeias de caracteres
# listas cujos elementos sejam convertiveis para
# cadeias de caracteres
def my_list2string(list):
   if list == []:
       return "[]"
   s = "[ " + str(list[0])
   for i in range(1,len(list)):
       s += ", " + str(list[i])
   return s + " ]"
