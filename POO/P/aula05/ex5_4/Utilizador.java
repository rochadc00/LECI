package ex5_4;
import java.util.ArrayList;


public class Utilizador {

    private String nome;
    private int nMec;
    private String curso;
    ArrayList<Integer> ids = new ArrayList<>();

    public Utilizador(String n, int nm, String c){
        nome = n;
        nMec = nm;
        curso = c;
    }

    public void setnMec(int nm){
        nMec = nm;
    }
    public int getnMec(){
       return nMec;
    }

    

    public void Request(int id){ ids.add(id); }          
               
    @Override
    public String toString() {
        return String.format("Aluno: %d; %s; %s", nMec, nome, curso);
    }

    public boolean HasSpace() {
        if(ids.size() < 3){
            return true;
        }
        return false; 
    }

    public boolean got(int id){

        for(int i=0; i < ids.size(); i++){
            if(ids.get(i)== id){
                return true;
            }
        }

        return false;
    }

    public void Remove(int id){
        for(int i=0; i < ids.size(); i++){
            if(ids.get(i)== id){
                ids.remove(i);
            }
        }

    }
    
}
