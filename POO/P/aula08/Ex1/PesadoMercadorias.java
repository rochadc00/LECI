package Ex1;

public class PesadoMercadorias extends Viatura implements Pesados{
    private int NQuadro, peso, CargaMaxima;

    public PesadoMercadorias(String matricula, String marca, int peso, String modelo, int cilindrada, int NQuadro, int CargaMaxima){
        super(matricula, marca, modelo, cilindrada);
        this.NQuadro = NQuadro;
        this.peso = peso;
        this.CargaMaxima = CargaMaxima;
    }

    public int getNQuadro() {
        return NQuadro;
    }

    public int getCargaMaxima() {
        return CargaMaxima;
    }

    public int getPeso() {
        return peso;
    }

    @Override
    public int getPotencia() {
        // TODO Auto-generated method stub
        return super.getPotencia();
    }

    @Override
    public String toString() {
        String s = "Pesado de Mercadorias:(Numero do Quadro: "+NQuadro+", Peso: "+peso+", Carga Maxima: "+CargaMaxima+") ";
        return s+super.toString();
    }
}
