package QA;

public class Ponto { 
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
    // .. 
    public boolean equals(Object obj) {
        if (this == obj)
        return true;
        if (obj == null)
        return false;
        if (getClass() != obj.getClass())
        return false;
        Ponto other = (Ponto) obj;
        // verify if the object’s attributes are equals

        if (!(x == other.x)){
            return false;
        }
        if (!(y == other.y)){
            return false;
        }
        return true;
        }
}
