package aula02;
import java.util.Scanner;
import java.lang.Math;

/*ATENÇÃO: MELHORIAS NO CÓDIGO FORAM FEITAS ATÉ AO EXERCÍCIO 3. Segundo o professor Carlos Bastos, não era necessário mostrar as mesmas melhorias em todos os exercícios, ficando implicito o conhecimento destas em alguns exemplos*/

public class Ex8 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double c1,c2,h,a;
        System.out.print("Inserir cateto A: ");
        c1 = sc.nextDouble();
        System.out.print("Inserir cateto B: ");
        c2 = sc.nextDouble();

        h = Math.sqrt(Math.pow((c1), 2)+Math.pow((c2), 2));
        System.out.println(String.format("Hipotenusa: %.2f",h));

        a = Math.toDegrees(Math.acos(c2/h));

        System.out.println(String.format("Ângulo: %.2f",a));
        sc.close();
    }
}
