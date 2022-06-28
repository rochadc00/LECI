package Ex1;

public class run {
    public static void main(String[] arg) {
        Viatura v0 = new Viatura("00-AA-B2", "Mercedes", "A", 330);
        // System.out.println(v0);
        // Testing motociclo
        Motociclo m0 = new Motociclo("78-GH-92", "Seat", "A7", 560, "Desportivo");
        // System.out.println(m0);
        // Testing Automovel Ligeiro
        AutomovelLigeiro a0 = new AutomovelLigeiro("71-GD-92", "Seat", "C7", 660, 230, 50);
        // System.out.println(a0);
        // Testing Taxi
        Taxi t0 = new Taxi("71-GD-92", "Tesla", "3", 660, 230, 52, 1278);
        // System.out.println(t0);
        // Testing KmPercorridos
        PesadoPassageios pp = new PesadoPassageios("71-GD-92", "Tesla", "3", 660, 230, 52,40);
        // System.out.println(t0);
        // Testing Pesados

        m0.trajeto(40);
        // System.out.println(m0.distanciaTotal());
        // Testing Empresa
        Empresa e0 = new Empresa("FlyHigh", "flyViaturas@flyhigh.com", 4200);
        e0.adicionaViatura(m0);
        e0.adicionaViatura(v0);
        e0.adicionaViatura(a0);
        e0.adicionaViatura(t0);
        e0.adicionaViatura(pp);
        System.out.println(e0);

    }

}
