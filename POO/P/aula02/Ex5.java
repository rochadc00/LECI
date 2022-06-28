package aula02;
import java.util.*;

/*ATENÇÃO: MELHORIAS NO CÓDIGO FORAM FEITAS ATÉ AO EXERCÍCIO 3. Segundo o professor Carlos Bastos, não era necessário mostrar as mesmas melhorias em todos os exercícios, ficando implicito o conhecimento destas em alguns exemplos*/

public class Ex5 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        double V1,D1,V2,D2,T1,T2,Tf,Dt,Vf;
        System.out.print("Inserir Velocidade1: ");
        V1 = sc.nextDouble();
        System.out.print("Inserir Distância1: ");
        D1 = sc.nextDouble();
        System.out.print("Inserir Velocidade2: ");
        V2 = sc.nextDouble();
        System.out.print("Inserir Distância2: ");
        D2 = sc.nextDouble();

            T1 = D1 / D1;
            T2 = D2 / V2;
            Tf = T1 + T2;
            Dt = D1 + D2;
            Vf = Dt/Tf;

            System.out.print("Velocidade média final: " + Vf);

        sc.close();

    }
    
}
