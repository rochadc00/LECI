package Ex1;

public class Agencia {
    private String nome;
    private String endereço;
    alojamento [] al = new alojamento[20];
    int nal = 0;

    public Agencia(String nome, String endereço){
        this.nome = nome;
        this.endereço = endereço;
        
    }

    public void adiciona (alojamento a){
        al[nal] = a;
        nal++;
    }

    /**
     * @return String return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return String return the endereço
     */
    public String getEndereço() {
        return endereço;
    }

    /**
     * @param endereço the endereço to set
     */
    public void setEndereço(String endereço) {
        this.endereço = endereço;
    }

    @Override
    public String toString() {
        String s = "";
        for(int i=0; i < nal; i++){
            s += al[i] + "\n";
        }
        return "Agencia: " + nome + "; " + endereço + "\n" + s;
    }

    


}