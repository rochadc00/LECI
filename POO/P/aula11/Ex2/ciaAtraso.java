package Ex2;


public class ciaAtraso  implements Comparable<ciaAtraso>{
	String nome;
	Hora atraso;
	String rawData;
	
	public ciaAtraso(String a) {
		String[] data = a.split(";");
		this.nome=data[0];
		this.atraso=Hora.getHora(data[1]);
		this.rawData=a;
	}
	
	public Hora getAtraso() {
		return atraso;
	}
	
	public int compareTo(ciaAtraso outra) {
		return this.atraso.compareTo(outra.getAtraso());
	}
	
	public String toString() {
		return rawData;
	}

}
