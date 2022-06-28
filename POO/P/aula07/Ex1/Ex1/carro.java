package Ex1;

public class carro {
    private final char classe; //A-F
    private String tipo;
    private boolean disponivel;
    private int id;

    public carro(char classe, String tipo, boolean disponivel, int id){
        this.classe = classe;
        this.tipo = tipo;
        this.disponivel = disponivel;
        this.id = id;
    }

    public void levantar(int id){
        if (disponivel==true){
            this.disponivel = false;
        }
        else{
            erro("Carro nao disponivel");
        }
    }

    public void entregar(int id){
        if(disponivel==false){
            this.disponivel = true;
        }
        else{
            erro("Carro disponivel, impossivel realizar entrega");
        }
    }

    private void erro(String s) {
        System.out.println("Falha ao realizar pedido: "+s);
    }

    /**
     * @return String return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return boolean return the disponivel
     */
    public boolean isDisponivel() {
        return disponivel;
    }

    /**
     * @param disponivel the disponivel to set
     */
    public void setDisponivel(boolean disponivel) {
        this.disponivel = disponivel;
    }

    @Override
    public String toString() {
        String s = String.format("Classe: %c, Tipo: %s  Disponibilidade: %s  ID: %d", classe, tipo, disponivel, id);
        if(disponivel==true){
            return s;
        }else{
            return s + "; Carro ocupado";
        }
    }

}
