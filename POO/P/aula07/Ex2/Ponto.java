package Ex2;

public class Ponto{ 
    private double x; 
    private double y; 

    public Ponto(double x, double y) {
        this.x = x;
        this.y = y;
        // ..
    } // completar 
    public double getx() {
        return x;
    } 
    public double gety() {
        return y;
    } 
    public String toString() {
        return "(" + x + "," + y + ")";
    }
    public double Distancia(Ponto p){
        double xDistance = x - p.getx();
        double yDistance = y - p.gety();
        double distance = Math.sqrt(Math.pow(xDistance, 2) + Math.pow(yDistance, 2));
        return distance;
    } 

}
