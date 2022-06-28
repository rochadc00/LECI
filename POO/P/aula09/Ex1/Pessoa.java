package Ex1;

public class Pessoa {
    
    private String nome;
    private int cc;
    private Data dataNasc;
    
    public Pessoa (String nome, int cc, Data dataNasc){
        this.nome = nome;
        this.cc = cc;
        this.dataNasc = dataNasc;
    }
    @Override
    public String toString() {
        return "Nome: "+nome+"; CC: "+cc+"; Data de Nascimento: "+dataNasc+";";
    }

    public Data getDataNasc() {
        return dataNasc;
    }

    public int getCc() {
        return cc;
    }

    public String getNome() {
        return nome;
    }

    @Override
	public int hashCode() {
		return cc+dataNasc.hashCode()+nome.toLowerCase().hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		if (!(obj instanceof Pessoa))
			return false;
		Pessoa other = (Pessoa) obj;
		if (cc != other.cc)
			return false;
		if (dataNasc == null) {
			if (other.dataNasc != null)
				return false;
		} else if (!dataNasc.equals(other.dataNasc))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equalsIgnoreCase(other.nome))
			return false;
		return true;
	}
}


