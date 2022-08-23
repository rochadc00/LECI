package Ex2;

public class Alimento {
    double proteinas, calorias, peso;
	String nome;
	
	//Construtor
	public Alimento(double proteinas, double calorias, double peso, String nome) {
		this.proteinas=proteinas;
		this.calorias=calorias;
		this.peso=peso;
		this.nome = nome;
	}
	
	//Métodos
	public double getProteinas() {
		return proteinas*peso/100;
	}

	public double getCalorias() {
		return calorias*peso/100;
	}

	public double getPeso() {
		return peso;
	}

	public void setProteinas(double proteinas) {
		this.proteinas = proteinas;
	}

	public void setCalorias(double calorias) {
		this.calorias = calorias;
	}

	public void setPeso(double peso) {
		this.peso = peso;
	}

	@Override
	public int hashCode() { //Soma das variáveis 
		return (int)(proteinas+calorias+peso);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Alimento))
			return false;
		Alimento other = (Alimento) obj;
		if (calorias != other.getCalorias())
			return false;
		if (proteinas != other.getProteinas())
			return false;
		if (peso != other.getPeso())
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format("Proteínas %.1f, Calorias %.1f, Peso %.1f", proteinas, calorias, peso);
	}	
	
}
