package Ex1;

public class quarto_hotel extends alojamento {
    String tipo;
    public quarto_hotel(String codigo, String nome, String local, double preço_noite, boolean disponibilidade, double avaliaçao, String tipo){
        super(codigo, nome, local, preço_noite, disponibilidade, avaliaçao);
        this.tipo = tipo;
    }
    public String getTipo() {
        tipo = tipo.toLowerCase();
        if(tipo.equals("single") || tipo.equals("double") || tipo.equals("twin") || tipo.equals("triple")){
            return tipo;
        }
        else{
            return "ERROR unknown value";
        }
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    @Override
    public String toString() {
        return "Este quarto de hotel ("+getTipo()+") pertence ao "+super.toString();
    }
}
