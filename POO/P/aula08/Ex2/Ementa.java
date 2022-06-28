package Ex2;

public class Ementa {
    private String nome, local;
    private Prato[] Pratos;
    private int NPratos=0;

    public Ementa(String nome, String local){
        this.nome = nome;
        this.local = local;
        Pratos = new Prato[20];
    }

    public String getNome() {
        return nome;
    }

    public String getLocal() {
        return local;
    }

    public void addPrato(Prato p){
        Pratos[NPratos] = p;
        NPratos++;
    }

    @Override
    public String toString() {
        String s ="";
        if (NPratos != 0){
            for(Prato pr : Pratos){
                if(pr != null){
                    s += pr+"\n";
                }
            }
            return s;
        }
        return "Ementa vazia";
    }
    
}
