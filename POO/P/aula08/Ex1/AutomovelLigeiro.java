package Ex1;
public class AutomovelLigeiro extends Viatura{
    private int capacidadeda_bagageira, numero_do_quadro;

    public AutomovelLigeiro(String matricula, String marca, String modelo, int cilindrada, int numero_do_quadro, int capacidadeda_bagageira){
        super(matricula, marca, modelo, cilindrada);
        this.numero_do_quadro = numero_do_quadro;
        this.capacidadeda_bagageira = capacidadeda_bagageira;
    }
    
    public int getNumero_do_quadro() {
        return numero_do_quadro;
    }

    public int getCapacidadeda_bagageira() {
        return capacidadeda_bagageira;
    }

    @Override
    public int getPotencia() {
        // TODO Auto-generated method stub
        return super.getPotencia();
    }

    @Override
    public String toString() {
        String s = "Automovel Ligeiro: numero do quadro: "+numero_do_quadro+", Capacidade da Bagageira: "+capacidadeda_bagageira+"kg";
        return s+", "+super.toString();
    }
}
