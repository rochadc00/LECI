package ex2;

public class Conjunto {

    private int[] cnj = new int[100];
    private int currn = 0;

    public int get(int i){
        return cnj[i];
    }

    void insert(int n){

        for(int i = 0; i < cnj.length; i++ ){
            if(cnj[i] == n ){
               return;
            }
        }
        cnj[currn] = n;
        currn++;
        
    } 

    public boolean contains(int n){

        for(int i = 0; i < cnj.length; i++ ){
            if(cnj[i] == n ){
               return true;
            }
        }

        return false;
    } 

    public void remove(int n){

        boolean gate = false;
        for(int i = 0; i < cnj.length -1 ; i++ ){
            if(cnj[i] == n ){
                gate = true;
                currn--;
            }
            if(gate){
                cnj[i] = cnj[i + 1]; // valor que está à frente vem para uma casa antes
            }
        }
        
    }  

    public void empty(){
        currn = 0;
    }  

    public String toString(){
        String s = "";

        for(int i = 0; i < currn; i++ ){
            s+= cnj[i] + " ";
        }
        return s;

    }  

    public int size(){
        return currn;
    }  

    
    public Conjunto unir(Conjunto add){
        Conjunto cUn = new Conjunto();
        
        for(int i = 0; i < currn; i++ ){
            for(int e = 0; e < add.size(); e++ ){
                int value = add.get(e);
                if(cnj[i] == value) {
                    cUn.insert(cnj[i]);
                }else{
                cUn.insert(cnj[i]);
                cUn.insert(add.get(e));
                }
            }
        }
        return cUn;
    }  

    public Conjunto subtrair(Conjunto dif){
        Conjunto cDif = new Conjunto();
        cDif.empty();
        
        for(int e = 0; e < dif.size(); e++ ){
            for(int i = 0; i < currn; i++ ){
                if(!(dif.contains(cnj[i]))){    // se o conjunto não tiver nenhum elemento com o conjunto cnj,
                    cDif.insert(cnj[i]);        // então vamos adicionar esse elemento a um novo conjunto e esta
                }                               // representa um conjunto com a diferença entre ambos
            }
        }    
        return cDif;
    }  

    public Conjunto interset(Conjunto inter)
    {
        Conjunto cInt = new Conjunto();
        cInt.empty();
        
        for(int e = 0; e < inter.size(); e++ ){
            for(int i = 0; i < currn; i++ ){
                if(inter.contains(cnj[i])){
                    cInt.insert(cnj[i]);
                }
            }
        }    
        return cInt;
    }  
    
}
