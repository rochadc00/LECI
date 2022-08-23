package Ex1;

public class PesadoPassageios extends Viatura{
    private int NQuadro, Peso, MaxPassageiros;

    public PesadoPassageios(String matricula, String marca, String modelo, int cilindrada, int NQuadro, int Peso, int MaxPassageiros){
        super(matricula, marca, modelo, cilindrada);
        this.NQuadro = NQuadro;
        this.Peso = Peso;
        this.MaxPassageiros = MaxPassageiros;
    }

    public int getNQuadro() {
        return NQuadro;
    }

    public int getPeso() {
        return Peso;
    }

    public int getMaxPassageiros() {
        return MaxPassageiros;
    }

    @Override
    public int getPotencia() {
        // TODO Auto-generated method stub
        return super.getPotencia();
    }

    @Override
    public String toString() {
        String s = "Pesado de Mercadorias:(Numero do Quadro: "+NQuadro+", Peso: "+Peso+", Numero Maximo de Passageiros: "+MaxPassageiros+") ";
        return s+super.toString();
    }
    
}
