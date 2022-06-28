package Ex2;

public class robo extends ObjetoMovel{
    private String id, tipo_jogador;
    private int nGolos;

    //Construtor
    public robo(Ponto p, String id, String tipo_jogador, int nGolos){
        super(p);
        this.id = id;
        this.tipo_jogador = tipo_jogador;
        this.nGolos = nGolos;
    }
    //Metodos
    public void MarcarGolo(String id){
        nGolos++;
        
    }
    @Override
    public String toString() {
        return "Robo: "+tipo_jogador+", id: "+id+": "+nGolos+" golo";
    }

    public int getnGolos() {
        return nGolos;
    }

    public String getId() {
        return id;
    }

}
