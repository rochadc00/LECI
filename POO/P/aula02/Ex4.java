package aula02;
import java.util.Scanner;

public class Ex4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner (System.in);

        double value, juro,ajuda;
        
	System.out.print("Introduza o montante investido: ");
	value = sc.nextDouble();

	System.out.print("Introduza a taxa de juro mensal: ");
	juro = sc.nextDouble();

       juro = juro/100;

       for(int i=0; i<3; i++){
           ajuda = value*juro;
           value = value + ajuda;
       }

        System.out.println("Final Value: " + value);

        sc.close();

    }
}
