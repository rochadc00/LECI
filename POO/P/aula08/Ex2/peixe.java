package Ex2;

public class peixe extends Alimento{
    private String tipo;

    public peixe(double proteinas, double calorias, double peso, String tipo){
        super(proteinas, calorias, peso);
        this.tipo = tipo;
    }

    public String getTipo() {
        return tipo;
    }

    @Override
    public String toString() {
        return tipo;
    }
    
}
