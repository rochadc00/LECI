package ex5_3;

public class Ponto {
    private double x;
    private double y;


    public Ponto(double x, double y) { 
        this.x = x;
        this.y = y;
     } 



    public double getX() { return x;}
    public double getY() { return y;}

    public String toString(){ 
        String i = "Ponto: (" + x + ", " + y + ")";
        return i;
    }
    
}
