package ex5_3;

public class Sqr {
    private float comprimento;
    private float altura;

    public Sqr(float c, float a){
        comprimento = c;
        altura = a;
    }

    public float getC() { return comprimento;}
    public float getA() { return altura;}

    public void setC(float c) { comprimento = c;}
    public void setA(float a) { altura = a;}

    public String toString(){ 
        String i = "Square: compirmento=" + comprimento + "; altura=" + altura;
        return i;
    }
    public float Perimetro(){
        
        return comprimento*2 + altura*2;
    }
    public float Area(){
        return comprimento*altura;
    }
   
   }
