package Ex1;

public class run{
    public static void main(String[] string){      
        Agencia A = new Agencia("Fly", "Rua Palmeira Alta, 38");
        System.out.println(A);
        alojamento b = new alojamento("6315","Master Bed","Space Trip",50.0,true,5.0); 
        A.adiciona(b);
        System.out.println(A);
        //apartamento c = new apartamento("6315","hotel1","local",50.0,true,5.0,6);
        //System.out.println(c);
        //quarto_hotel d = new quarto_hotel("6315","hotel1","local",50.0,true,5.0,"abs");
        //System.out.println(d);
        b.CheckOut("Joana Fonte");
        System.out.println(b);
        b.CheckIn("mo");
        System.out.println(b);
        carro c = new carro('D', "Gasolina", true, 290);
        c.levantar(290);
        System.out.println(c);
        
    }
}