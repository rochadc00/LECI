package Ex1;

public class alojamento {
    private String codigo, nome, local, nome_hospede;
    private double preço_noite;
    private boolean disponibilidade;
    private double avaliaçao;
    
    public alojamento(String codigo, String nome, String local, double preço_noite, boolean disponibilidade, double avaliaçao){
        this.codigo = codigo;
        this.nome = nome;
        this.local = local;
        this.preço_noite = preço_noite;
        this.disponibilidade = disponibilidade;
        this.avaliaçao = avaliaçao;

    }
    public void CheckIn(String nome_hospede){
        if(disponibilidade==true){
            this.nome_hospede = nome_hospede;
            this.disponibilidade = false;
        }
        else{
            erro("Alojamento ocupado");
        }
    }
    private void erro(String s) {
        System.out.println("Falha ao realizar pedido: "+s);
    }
    public void CheckOut(String nome_hospede){
        if(disponibilidade==false){
            this.nome_hospede = null;
            this.disponibilidade = true;
        }
        else{
            erro("Alojamento livre");
        }
    }
    /**
     * @return String return the codigo
     */
    public String getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    /**
     * @return String return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return String return the nome
     */
    public String getNome_hospede() {
        return nome_hospede;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome_hospede(String nome_hospede) {
        this.nome_hospede = nome_hospede;
    }

    /**
     * @return String return the local
     */
    public String getLocal() {
        return local;
    }

    /**
     * @param local the local to set
     */
    public void setLocal(String local) {
        this.local = local;
    }

    /**
     * @return double return the preço_noite
     */
    public double getPreço_noite() {
        return preço_noite;
    }

    /**
     * @param preço_noite the preço_noite to set
     */
    public void setPreço_noite(double preço_noite) {
        this.preço_noite = preço_noite;
    }

    /**
     * @return boolean return the disponibilidade
     */
    public boolean isDisponibilidade() {
        return disponibilidade;
    }

    /**
     * @param disponibilidade the disponibilidade to set
     */
    public void setDisponibilidade(boolean disponibilidade) {
        this.disponibilidade = disponibilidade;
    }

    /**
     * @return double return the avaliaçao
     */
    public double getAvaliaçao() {
        if(avaliaçao<=5 && avaliaçao>=0){
            return avaliaçao;
        }
        else{
            return 0;
        }
    }

    /**
     * @param avaliaçao the avaliaçao to set
     */
    public void setAvaliaçao(double avaliaçao) {
        this.avaliaçao = avaliaçao;
    }

    @Override
    public String toString() {
        String s = "Alojamento: (" + codigo + "; " + nome + "; " + local + "; " + preço_noite + "; " + disponibilidade + "; " + getAvaliaçao() + ")";
        if (disponibilidade==true){
            return s;
        }
        else{
            return s+"; Ocupado por: "+nome_hospede;
        }
    }

}