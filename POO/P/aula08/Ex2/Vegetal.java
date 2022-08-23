package Ex2;

public class Vegetal extends Alimento implements Vegetariano{
    private String nome;
    
    public Vegetal(double proteinas, double calorias, double peso, String nome){
        super(proteinas, calorias, peso);
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }


    @Override
    public String toString() {
        String s = "Vegetal: "+nome+", "+super.toString();
        return s;
    }
}
