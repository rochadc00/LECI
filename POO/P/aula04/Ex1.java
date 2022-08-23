package aula04;
import java.util.Scanner;

public class Ex1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String frase;
        System.out.print("Introduzir frase ou palavra: ");
        frase = sc.nextLine();
        System.out.println(frase.toLowerCase());
        char ch = frase.charAt(frase.length()-1);
        System.out.println(ch);
        System.out.println(frase.substring(0,3));
        sc.close();
    }
}
