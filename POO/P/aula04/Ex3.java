package aula04;
import java.util.Scanner;

public class Ex3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String frase;
        System.out.print("Introduzir frase ou palavra: ");
        frase = sc.nextLine();
        System.out.println(Acron(frase).toUpperCase());
        sc.close();
    }

    public static String Acron(String s){
        if (s == null || s.isEmpty()) {
            return "n/d";
        }
      
        String[] words = s.split(" ");
        String Acron = "";
        for (int i=0;i<words.length;i++){
            if (words[i].length()>=3){
                char ch = words[i].charAt(0);
                Acron = Acron+ch;
            }
        }
        return Acron;
    }
}