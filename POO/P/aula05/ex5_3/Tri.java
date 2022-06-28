package ex5_3;


public class Tri {
    private float lado1;
    private float lado2;
    private float lado3;
    

    public Tri(float l1, float l2, float l3){
        lado1 = l1;
        lado2 = l2;
        lado3 = l3;
    }
    public float getL1() { return lado1;}
    public float getL2() { return lado2;}
    public float getL3() { return lado3;}

    public void setL1(float l1) { lado1 = l1;}
    public void setL2(float l2) { lado2 = l2;}
    public void setL3(float l3) { lado3 = l3;}

    public String toString(){ 
        String i = "Triangle: lado1= " + lado1 + "; lado2= " + lado2 + "; lado3= " + lado3;
        return i;
    }
    public float Perimetro(){
        
        return lado1+lado2+lado3;
    }
    public double Area(){
        double hlfP = (this.Perimetro()) / 2;
        return Math.sqrt(hlfP * (hlfP - lado1) * (hlfP - lado2) * (hlfP - lado3)); 
    }
   
   }
