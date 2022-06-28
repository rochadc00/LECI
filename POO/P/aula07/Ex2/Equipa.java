package Ex2;

public class Equipa {
    private String nome,responsavel;
    private int golosMarcados=0;
	private int golosSofridos=0;
	private robo[] jogadores;
    private int nJogadores=0;

    //Construtor
    public Equipa(String nome, String responsavel, int n){
        jogadores = new robo[n];
        this.nome = nome;
        this.responsavel = responsavel;
    }

    //Metodos
    public void AdicionarJogador(robo r){
        for(int i=0; i<=jogadores.length; i++){
            if (jogadores[i]==null){
                jogadores[i]=r;
                nJogadores++;
                System.out.println("Jogador: ("+jogadores[i]+") adicionado com sucesso"+i);
                break;
            }else{
                System.out.println("Equipa cheia");
            }
        }

    }
    public void goloMarcado() {
		golosMarcados++;
	}
	
	public void goloSofrido() {
		golosSofridos++;
	}

    @Override
    public String toString() {
        String elementos = "";
        for (int i=0; i<nJogadores; i++){
            elementos += "("+jogadores[i]+")\n";
        }
        return "Equipa com "+nJogadores+" elementos; Composta por : "+elementos+"\nNome da Equipa: "+nome+" Resposavel: "+responsavel+"\n Tem "+golosMarcados+
        " golos marcados, e "+golosSofridos+" golos sofridos";
    }

    //Métodos get/set
	public String getNome() {
		return nome;
	}
	
	public String getResponsavel() {
		return responsavel;
	}
	
	public robo[] getJogadores() {
		return jogadores;
	}
	
	public int getGolosMarcados() {
		return golosMarcados;
	}
	
	public int getGolosSofridos() {
		return golosSofridos;
	}
}
