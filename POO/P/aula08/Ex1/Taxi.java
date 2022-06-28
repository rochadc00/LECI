package Ex1;
public class Taxi extends AutomovelLigeiro{
    private int NumeroLicensa;

    public Taxi(String matricula, String marca, String modelo, int potencia, int numero_do_quadro, int capacidadeda_bagageira, int NumeroLicensa){
        super(matricula, marca, modelo, potencia, numero_do_quadro, capacidadeda_bagageira);
        this.NumeroLicensa = NumeroLicensa;
    }

    public int getNumeroLicensa() {
        return NumeroLicensa;
    }

    @Override
    public String toString() {
        String s =  "Taxi: "+NumeroLicensa+", ";
        return s+super.toString();
    }

    @Override
    public int getPotencia() {
        // TODO Auto-generated method stub
        return super.getPotencia();
    }
}
