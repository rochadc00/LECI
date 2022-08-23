package ex5_4;

public class Livro {
    
    private int id;
    private static int ids = 99;
    private String titulo;
    private String tipoEmprestimo = "NORMAL"; 
    private boolean Available = true;

    public Livro(String t, String tp){ 
        ids++;
        id = ids;
        titulo = t;
        tipoEmprestimo = tp;
    }
    public Livro(String t){
        ids++;
        id = ids;
        titulo = t;
    }

    public String getTitulo(){return titulo;}
    public String getTipoEmprestimo(){return tipoEmprestimo;}
    public int getId(){return id;}
    public boolean getAvailability(){return Available;}

    @Override
    public String toString() {
        return String.format("Livro %d; %s; %s", id, titulo, tipoEmprestimo);
    }
    public void setTipoEmprestimo(String tp){
        tipoEmprestimo = tp;
    }
    public void setTitulo(String t){
        titulo = t;
    }

    public void SetAvailability(boolean x){
        Available = x;
    }
    
    
}
