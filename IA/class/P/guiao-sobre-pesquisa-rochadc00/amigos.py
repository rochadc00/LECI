from constraintsearch import *

friends = ["Andre", "Bernardo", "Claudio"]

def make_domains(friends):
    return {friend: [(hat,bike) for hat in friends for bike in friends] for friend in friends}

def constraints(friend1,x1,friend2,x2):
    hat1, bike1 = x1
    hat2, bike2 = x2
    if friend1 in x1 or friend2 in x2:
        return False
    if x1 in x2:
        return False
    if hat1==bike1 or hat2==bike2:
        return False
    return True

def make_constraint_graph(friends):
    return {(f1,f2): constraints for f1 in friends for f2 in friends if f1!=f2}

cs = ConstraintSearch(make_domains(friends), make_constraint_graph(friends))

print(cs.search())
