package Ex1;

public class Motociclo extends Viatura{
    private String tipo; //Desportivo; Estrada


    public Motociclo(String matricula, String marca, String modelo, int cilindrada, String tipo){
        super(matricula,marca,modelo,cilindrada);
        this.tipo = tipo;

    }

    public String getTipo() {
        return tipo;
    }

    @Override
    public int getPotencia() {
        // TODO Auto-generated method stub
        return super.getPotencia();
    }

    @Override
    public String toString() {
        return "Motociclo: "+tipo+", "+super.toString();
    }

}
