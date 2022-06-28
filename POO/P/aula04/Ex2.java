package aula04;
import java.util.Scanner;


public class Ex2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String frase;
        System.out.print("Introduzir frase ou palavra: ");
        frase = sc.nextLine();
        System.out.println("A frase '"+ frase + "' tem " + countDigits(frase)+ " números");
        System.out.println("A frase '"+ frase + "' tem " + countSpaces(frase)+ " espaços");
        if (frase.toLowerCase() == frase){
            System.out.println("A frase só contém minusculas");
        }
        System.out.println(removeSpaces(frase)); 
        if (frase.equals(reverseString(frase))){
            System.out.println("É um palíndromo");
        }
        else{
            System.out.println("Não é um palíndromo"); 
        }
        sc.close();
    }
    public static int countDigits(String frase){
        int c = 0;
        for (int i = 0; i < frase.length(); i++){
            if (Character.isDigit(frase.charAt(i)) == true){
                    c++;
                }
        }
        return c;
    }
    public static int countSpaces(String frase){
        int c = 0;
        for (char a : frase.toCharArray()) {
            if (a == ' ') {
                 c++;
            }
        }
        return c;
    }
    static String removeSpaces( String frase){
        return frase.trim().replaceAll(" +"," ");
    }

    static String reverseString(String frase){
        StringBuilder frase1 = new StringBuilder();
        frase1.append(frase);
        frase1.reverse();
        String f1 = frase1.toString();
        return f1;
    }

}
