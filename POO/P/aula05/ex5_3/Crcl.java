package ex5_3;
import java.lang.Math;

public class Crcl {
    private float centro[];
    private float raio;

    public Crcl(float[] c, float r){
        centro = c;
        raio = r;
    }
    public float[] getC() { return centro;}
    public float getR() { return raio;}
    public void setC(float[] c) { centro = c;}
    public void setR(float r) { raio = r;}
    


    public String toString(){ 
        String i = "Circle: centro=("+centro[0]+", "+centro[1] +")"+"; raio="+raio;
        return i;
    }
    public double Perimetro(){
        
        return 2*Math.PI*raio;
    }

    public double Area(){
        return Math.PI * (raio*raio);
    }

    public boolean Interscts(Crcl c2){

        double d = Math.sqrt( Math.pow(c2.getC()[0] - this.getC()[0],2) + Math.pow(c2.getC()[1] - this.getC()[1],2) );
        if(d <= c2.getR() + this.getR()){
            return true;
        }
        return false;
    }
    
   }
