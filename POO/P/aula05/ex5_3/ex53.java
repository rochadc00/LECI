package ex5_3;

public class ex53 {
    
    public static void main(String[] string){

        Ponto p = new Ponto(1, 2);
        Sqr s = new Sqr(1, 2);
        float[] centro = {2,3};
        float[] centro2 = {3,1};
        Crcl c = new Crcl( centro ,  1);
        Crcl c2 = new Crcl( centro2 ,  2);
        Tri t = new Tri(1, 2, 1);

        System.out.println(p.toString());
        System.out.println(s.toString());
        System.out.println(c.toString());
        System.out.println(t.toString());

        System.out.println(c.Interscts(c2));
       

    }
}

