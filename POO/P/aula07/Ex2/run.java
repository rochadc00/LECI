package Ex2;
public class run {
    public static void main(String[] string){  
    Ponto p0 = new Ponto(0,0);    
    Ponto p1 = new Ponto(10,7);
    Ponto p2 = new Ponto(20,3);
    ObjetoMovel Obj1 = new ObjetoMovel(p1);
    Obj1.move(p2);
    Obj1.move(p1);

    robo r = new robo(p0, "f34", "Guarda Redes", 0);
    r.MarcarGolo("f34");
    System.out.println(r);
    r.move(p2);
    r.getPosiçao();
    Equipa A = new Equipa("nome", "responsavel", 5);
    A.AdicionarJogador(r);
    A.goloMarcado();
    A.goloMarcado();
    A.goloSofrido();
    System.out.println(A);


    }
}
