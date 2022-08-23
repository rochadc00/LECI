package QA;

public class Poligono {
    Ponto [] pts;
    int npts = 0;

    public Poligono(){
        pts = new Ponto[20];

    }

    public void adiciona (Ponto p){
        pts[npts] = p;
        npts++;
    }

    public String toString(){
        String s = "";

        for(int i = 0; i < npts; i++ ){
            s+= pts[i] + " ";
        }

        return s;
    }  

    public double perimetro(){
        double per = 0;
        for(int i = 0; i < npts-1; i++){
            per += pts[i].Distancia(pts[i+1]);

        }
        per += pts[0].Distancia(pts[npts-1]);
        return per;
    }

}
