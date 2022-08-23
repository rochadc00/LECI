package Ex2;

public class PratoDieta extends Prato{
    private double NCalorias;

    public PratoDieta(String nome, double NCalorias){
        super(nome);
        this.NCalorias = NCalorias;
    }

    public double getNCalorias() {
        return NCalorias;
    }
    
}
