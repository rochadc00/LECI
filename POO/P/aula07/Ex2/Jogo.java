package Ex2;


public class Jogo {
	private Equipa e1,e2;
	private Bola bola;
	private int tempoTotal=0;	//milisegundos
	private long tempoInicio=0;		//milisegundos
	
	//construtor
	public Jogo(Equipa e1, Equipa e2, Bola b, int tempoTotal) {
		this.e1=e1;
		this.e2=e2;
		this.bola=b;
		this.tempoTotal=tempoTotal*1000;	//input em segundos
	}
	
	//Métodos
	public void iniciar() {
		tempoInicio=System.currentTimeMillis();
	}
	
	public void prolongamento(int s) {	//s em segundos
		if (!terminado())
			tempoTotal+=s*1000;
		else
			System.out.println("\n[ERRO] Jogo terminado, pelo que o prolongamento não pode ser efetuado (apenas durante ou antes de começar)!");
	}
	
	public boolean terminado() {
		if(tempoInicio==0)
			return false;
		else if((System.currentTimeMillis()-tempoInicio)>tempoTotal)
			return true;
		else
			return false;
	}
	
	public void golo(String id) {
		if(!terminado()) {
			for(robo r:e1.getJogadores()) {
				if(r.getId().equalsIgnoreCase(id)) {
					r.MarcarGolo(id);
					e1.goloMarcado();
					e2.goloSofrido();
					break;
				}
			}
			for(robo ro:e2.getJogadores()) {
				if(ro.getId().equalsIgnoreCase(id)) {
					ro.MarcarGolo(id);
					e2.goloMarcado();
					e1.goloSofrido();
					break;
				}
			}
		}else {
			System.out.println("\n[ERRO] Jogo terminado! Golo não registado.\n");
		}
	}
	
	public String toString() {
		String s=">>Jogo com tempo total de "+timeToString((long)tempoTotal)+" segundos ";
		if(tempoInicio==0)
			s+="não iniciado";
		else if(terminado())
			s+="terminado (duração de "+Jogo.timeToString(tempoTotal)+")";
		else
			s+="em curso (duração de "+Jogo.timeToString(System.currentTimeMillis()-tempoInicio)+")";
		s+=" composto por:\n\t"+e1.toString()+"\n\t"+e2.toString()+"\n\t"+bola.toString();
		return s;
	}
	
	
	public static String timeToString(long time) {
		int h = (int)time/3600000;
		time-=h*3600000;
		int m = (int)time/60000;
		time-=m*60000;
		int s = (int)time/1000;
	    return String.format("%02dh %02dm %02ds", h,m,s);
	}
}
