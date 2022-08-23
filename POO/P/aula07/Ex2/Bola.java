package Ex2;

public class Bola extends ObjetoMovel{
    private String cor;
    public Bola(Ponto p, String cor){
        super(p);
        this.cor = cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    @Override
    public String toString() {
        return "cor da bola: "+cor;
    }
}
