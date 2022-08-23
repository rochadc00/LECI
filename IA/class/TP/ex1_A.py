x = [1,2,3]

def contar(x):
    if x==[]:
        return 0
    if x[0]>0:
        return x[0] + contar(x[1:])
    return contar(x[1:])