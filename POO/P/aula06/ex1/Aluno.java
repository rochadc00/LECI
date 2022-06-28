package ex1;

public class Aluno extends Pessoa{
    //... definição de atributos
    private Data iDataInsc;
    private int nMec;
    private static int num = 100;
    


    public Aluno(String iNome, int iBI, Data iDataNasc, Data iDataInsc) {
        super(iNome,iBI,iDataNasc);
        this.iDataInsc = iDataInsc;
        nMec = num;
        num++;
    }
    public Aluno(String iNome, int iBI, Data iDataNasc){
        super(iNome, iBI, iDataNasc);
        nMec = num;
        iDataInsc = Data.currentData();
        num++;

    }// nota: neste caso deve assumir a data atual 
    
    public int getNMec() {
        return nMec;
    }
    
    public Data getiDataInsc() {
        return iDataInsc;
    }

    @Override
    public String toString() {
        return super.toString()+ " Data de inscriçao: "+iDataInsc;
    }
}
