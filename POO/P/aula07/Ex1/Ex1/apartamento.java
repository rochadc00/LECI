package Ex1;

public class apartamento extends alojamento{
    int nquartos;
    public apartamento(String codigo, String nome, String local, double preço_noite, boolean disponibilidade, double avaliaçao, int nquartos){
        super(codigo, nome, local, preço_noite, disponibilidade, avaliaçao);
        this.nquartos = nquartos;
    }

    public int getNquartos() {
        return nquartos;
    }
    public void setNquartos(int nquartos) {
        this.nquartos = nquartos;
    }

    @Override
    public String toString() {
        return "Este apartamento tem "+nquartos+" quartos; e pertence ao "+super.toString();
    }

}


