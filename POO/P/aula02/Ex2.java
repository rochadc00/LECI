package aula02;
import java.util.Scanner;

public class Ex2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double C, F;
        //C = Double.parseDouble(str);
        try {
            System.out.print("Inserir Valor: ");
            C = sc.nextDouble();
            if (C < -273.15) 
                System.out.println("Temperatura em Celsius tem de ser superior a -273.15 Cº"); 
            else {
                F = 1.8*C +32;
                System.out.printf("O valor de %1f Cº em Fahrenheit é %1f\n",C, F);
            }
        } catch (Exception e) {
            System.out.println("Usou letra(s) para definir um valor real.");
        }
        sc.close();
    }
}
