package Ex1;


public class Viatura implements KmPercorridosInterface{
    private String matricula, marca, modelo;
    private int potencia, ultimoTrajeto, distanciaTotal;

    public Viatura(String matricula, String marca, String modelo, int potencia){
        this.matricula = matricula;
        this.marca = marca;
        this.modelo = modelo;
        this.potencia = potencia;
    }

    public int getPotencia() {
        return potencia;
    }

    public String getMarca() {
        return marca;
    }

    public String getMatricula() {
        return matricula;
    }

    public String getModelo() {
        return modelo;
    }

    public void trajeto(int quilometros) {
		distanciaTotal+=quilometros;
		ultimoTrajeto=quilometros;
	}

    public int ultimoTrajeto() {
		return ultimoTrajeto;
	}
	
	public int distanciaTotal() {
		return distanciaTotal;
	}
    
    @Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Viatura))
			return false;
		Viatura other = (Viatura) obj;
		if (!matricula.equals(other.getMatricula()))
			return false;
		return true;
	}

    @Override
    public String toString() {
        String s = "Matricula: "+matricula+", Marca: "+marca+", Modelo: "+modelo+", Potencia: "+potencia;
        return s;
    }

}
