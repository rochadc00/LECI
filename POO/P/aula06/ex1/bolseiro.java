package ex1;

public class bolseiro extends Aluno{
    private double montante;

    public bolseiro(String iiNome, int iiBI, Data iiDataNasc, Data iiDataInsc) {
        super(iiNome,iiBI,iiDataNasc,iiDataInsc);

    }

    public double getBolsa() {
        return montante;
    }

    public bolseiro(String iiNome, int iiBI, Data iiDataNasc,double montante){
        super(iiNome, iiBI, iiDataNasc);
        this.montante = montante; 
    }

    public void setBolsa(double montante) {
        this.montante = montante;
    }
}