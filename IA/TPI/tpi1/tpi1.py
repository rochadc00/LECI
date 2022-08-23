#Discussão de ideias com as alunas: Joana 98189, Lara 93427, Ana 98314

from tree_search import *
from cidades import *


class MyNode(SearchNode):
    def __init__(self,state,parent,cost,heuristic):
        super().__init__(state,parent)
        self.cost = cost
        self.heuristic = heuristic
        self.children = []
        self.eval = 0

class MyTree(SearchTree):

    def __init__(self,problem, strategy='breadth',seed=0): 
        super().__init__(problem,strategy,seed)
        root = MyNode(problem.initial, None, 0, problem.domain.heuristic(problem.initial, problem.goal))
        self.all_nodes = [root]
        self.solution_tree = None
        self.used_shortcuts = []

    def astar_add_to_open(self,lnewnodes):
        #IMPLEMENT HERE
        self.open_nodes = sorted(self.open_nodes+lnewnodes, key=lambda node: (self.all_nodes[node].cost) + (self.all_nodes[node].heuristic))

    def propagate_eval_upwards(self,node):

        if node.children == []:
            return self.propagate_eval_upwards(self.all_nodes[node.parent])

        Eval = []
        for evalsChild in node.children:
            Eval.append(self.all_nodes[evalsChild])

        minor = min(Eval,key = lambda save: save.eval)
        self.all_nodes[minor.parent].eval = minor.eval
     
        if(node.parent == None):
            return None
        self.propagate_eval_upwards(self.all_nodes[node.parent])

    def search2(self,atmostonce=False):
        #IMPLEMENT HERE
        while self.open_nodes != []:
            self.terminals = len(self.all_nodes)
            nodeID = self.open_nodes.pop(0)  
            node = self.all_nodes[nodeID]

            if self.problem.goal_test(node.state):
                self.solution = node
                self.terminals = len(self.open_nodes)+1
                return self.get_path(node)

            lnewnodes = []
            self.non_terminals += 1
            for a in self.problem.domain.actions(node.state):
                newstate = self.problem.domain.result(node.state,a)
                if newstate not in self.get_path(node):
                    newnode = MyNode(newstate, nodeID, node.cost + self.problem.domain.cost(node.state, a), self.problem.domain.heuristic(newstate, self.problem.goal))
                    self.all_nodes.append(newnode)
                    lnewnodes.append(len(self.all_nodes)-1)
                    
                    newnode.eval = newnode.cost + newnode.heuristic
                    newnode.cost = node.cost + self.problem.domain.cost(node.state,a)
                    node.children.append(len(self.all_nodes))
                    self.all_nodes.append(newnode)
                        
            self.propagate_eval_upwards(newnode)
            self.add_to_open(lnewnodes)
        return None

    def repeated_random_depth(self,maxattempts=3,atmostonce=False):
        minor_cost=float("inf")
        custo= 0
        
        for i in range(0,maxattempts):
            Ntree = MyTree(self.problem,'rand_depth',i)
            caminho = Ntree.search2()
            custo=Ntree.solution.cost

            if custo < minor_cost:
                minor_cost = custo
                self.solution_tree=Ntree

        return caminho
            

    def make_shortcuts(self):
        path = self.get_path(self.solution)
        for i in range(0,len(path)):
            if i >= len(path): break
            for search in self.problem.domain.actions(path[i]):
                if search[0] in path[i+1: len(path)]:
                    j = path.index(search[0])
                elif search[1] in path[i+1: len(path)]:
                    j = path.index(search[1])
                if j-i>1:
                    del path[i+1:j]
                    self.used_shortcuts.append(search)
        return path
        
class MyCities(Cidades):

    def maximum_tree_size(self,depth):   # assuming there is no loop prevention
        count = 0
        coords = self.coordinates
        cityNames = self.connections


        for coordenadas in coords:
            for citys in cityNames:
                #start searching at the 1 column
                if coordenadas == "Aveiro" and (citys[0] == "Aveiro" or citys[1] == "Aveiro"):
                    count = count + 1
                elif coordenadas == "Figueira" and (citys[0] == "Figueira" or citys[1] == "Figueira"):
                    count = count + 1  
                elif coordenadas == "Coimbra" and (citys[0] == "Coimbra" or citys[1] == "Coimbra"):
                    count = count + 1  
                elif coordenadas == "Agueda" and (citys[0] == "Agueda" or citys[1] == "Agueda"):
                    count = count + 1  
                elif coordenadas == "Viseu" and (citys[0] == "Viseu" or citys[1] == "Viseu"):
                    count = count + 1  
                elif coordenadas == "Braga" and (citys[0] == "Braga" or citys[1] == "Braga"):
                    count = count + 1  
                elif coordenadas == "Porto" and (citys[0] == "Porto" or citys[1] == "Porto"):
                    count = count + 1
                elif coordenadas == "Lisboa" and (citys[0] == "Lisboa" or citys[1] == "Lisboa"):
                    count = count + 1
                elif coordenadas == "Santarem" and (citys[0] == "Santarem" or citys[1] == "Santarem"):
                    count = count + 1
                elif coordenadas == "Leiria" and (citys[0] == "Leiria" or citys[1] == "Leiria"):
                    count = count + 1
                elif coordenadas == "Castelo Branco" and (citys[0] == "Castelo Branco" or citys[1] == "Castelo Branco"):
                    count = count + 1
                elif coordenadas == "Guarda" and (citys[0] == "Guarda" or citys[1] == "Guarda"):
                    count = count + 1
                elif coordenadas == "Evora" and (citys[0] == "Evora" or citys[1] == "Evora"):
                    count = count + 1
                elif coordenadas == "Beja" and (citys[0] == "Beja" or citys[1] == "Beja"):
                    count = count + 1
                elif coordenadas == "Faro" and (citys[0] == "Faro" or citys[1] == "Faro"):
                    count = count + 1
                elif coordenadas == "Guimaraes" and (citys[0] == "Guimaraes" or citys[1] == "Guimaraes"):
                    count = count + 1
                elif coordenadas == "Covilha" and (citys[0] == "Covilha" or citys[1] == "Covilha"):
                    count = count + 1
                elif coordenadas == "Lamego" and (citys[0] == "Lamego" or citys[1] == "Lamego"):
                    count = count + 1
                elif coordenadas == "Portalegre" and (citys[0] == "Portalegre" or citys[1] == "Portalegre"):
                    count = count + 1

        avg_branching = count/(len(coords))
        return (avg_branching**(depth+1)-1)/(avg_branching-1)


        


