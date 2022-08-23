package ex1;

public class Test{
    public static void main(String[] string){

        Aluno al = new Aluno ("Andreia Melo", 9855678,new Data(18, 7, 1990), new Data(1, 9, 2018));
        bolseiro bls = new bolseiro ("Igor Santos", 8976543, new Data(11, 5, 1985), 900);
        bls.setBolsa(1050);
        System.out.println("Aluno: " + al.getName());
        System.out.println(al);
        System.out.println("Bolseiro: " + bls.getName() + ", NMec: "
        + bls.getNMec() + ", Bolsa: " + bls.getBolsa());
        System.out.println(bls);
    }
}