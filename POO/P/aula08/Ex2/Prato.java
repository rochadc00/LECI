package Ex2;

public class Prato {
    private String nome;
    private Alimento[] ConjutnoAlimentos;
    int nAlimento = 0;

    // Construtor
    public Prato(String nome){
        this.nome = nome;
        ConjutnoAlimentos = new Alimento[20];
    }

    //Metodos
    public String getNome() {
        return nome;
    }

    public Alimento[] getConjutnoAlimentos() {
        return ConjutnoAlimentos;
    }

    public boolean addIngrediente(Alimento a){
        ConjutnoAlimentos[nAlimento] = a;
        nAlimento++;
        return true;
    }

    public void RemoveAlimento(Alimento a){

    }

    @Override
    public String toString() {
        int a=0;
        String ali = "";
        for (Alimento al:ConjutnoAlimentos){
            if (al!=null){
                a++;
                ali+=al.getNome()+", ";
            }
                
        }

        String s = getNome()+" Composto por: "+ a + " ingredientes: "+ali;
        return s;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Prato))
			return false;
		Prato other = (Prato) obj;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		return true;
    }

}
