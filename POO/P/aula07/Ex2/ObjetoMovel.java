package Ex2;

public class ObjetoMovel {
    private Ponto p;
    private double dist=0;

    public ObjetoMovel(Ponto p){
        this.p = p;
    }

    public void move(Ponto newP){
        this.dist+=p.Distancia(newP);
        p = newP;
        update_dist(dist);
    }

    public Ponto getPosiçao(){
        System.out.println("Posiçao: "+p);
        return p;
    }
    public void update_dist(double s){
        System.out.println("Distancia percorrida: "+s);
    }
    @Override
    public String toString() {
        return String.format("Distancia: %d",dist);
    }
}
