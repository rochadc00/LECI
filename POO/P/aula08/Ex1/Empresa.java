package Ex1;

public class Empresa {
    private String nome, email;
    private int CodigoPostal, NViaturas=0;
    private Viatura[] conjutnoViaturas;

    public Empresa(String nome, String email, int CodigoPostal){
        this.nome = nome;
        this.email = email;
        this.CodigoPostal = CodigoPostal;
        conjutnoViaturas = new Viatura[20];

    }

    public int getCodigoPostal() {
        return CodigoPostal;
    }
    
    public int getNViaturas() {
        return NViaturas;
    }

    public String getNome() {
        return nome;
    }

    public String getEmail() {
        return email;
    }

    public void adicionaViatura(Viatura v){
        conjutnoViaturas[NViaturas]=v;
        NViaturas++;
    }

    public void removerViatura(Viatura v){
        for(int i=0; i<=conjutnoViaturas.length; i++){
            if(conjutnoViaturas[i].equals(v)){
                conjutnoViaturas[i]=null;
            }
        }
    }



    @Override
    public String toString() {
        String s = "Empresa: "+nome+", Codigo Postal"+CodigoPostal+", email: "+email;
        String s1 = "Tem "+NViaturas+" viaturas";
        String s2 = "Viaturas Disponiveis:";
        String s3 = "";
        for(Viatura v : conjutnoViaturas){
            if(v!=null){
                s3+=v+"\n";
            }
            
        }
        return s+"\n"+s1+"\n"+s2+"\n"+s3;
    }
}
