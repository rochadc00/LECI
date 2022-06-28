package ex1;

public class Pessoa {
    
    private String nome;
    private int cc;
    private Data dataNasc;
    
    public Pessoa (String nome, int cc, Data dataNasc){
        this.nome = nome;
        this.cc = cc;
        this.dataNasc = dataNasc;
    }
    @Override
    public String toString() {
        return "Nome: "+nome+"; CC: "+cc+"; Data de Nascimento: "+dataNasc+";";
    }

    public Data getDataNasc() {
        return dataNasc;
    }

    public int getCc() {
        return cc;
    }

    public String getName() {
        return nome;
    }
}


