package Ex2;

public class carne extends Alimento{
    private String variedade;


    public carne(double proteinas, double calorias, double peso, String variedade){
        super(proteinas, calorias, peso, nome);
        this.variedade = variedade;
    }

    public String getVariedade() {
        return variedade;
    }

    
    @Override
    public String toString() {
        return variedade+", "+super.toString();
    }
    
}
