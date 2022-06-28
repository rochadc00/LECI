package QA;

public class main1 {
    public static void main(String[] string){      
        Poligono A = new Poligono();
        for(int i=0; i<5; i++){      
            //Ponto P = new Ponto( (int) (Math.random()*10),(int) (Math.random()*10)); // Pontos (int,int)
            Ponto P = new Ponto(Math.random(),Math.random());
            A.adiciona(P);
        }
        System.out.println(A);
        System.out.println(A.perimetro());
    }
}
