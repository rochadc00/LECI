package aula02;
import java.util.Scanner;

public class Ex1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in); 
        double km, miles;
        try{
            System.out.print("Inserir Valor: ");
            km = sc.nextDouble();
            if (km < 0) {
            System.out.println("Erro: O valor de km não pode ser negativo");    
            } else {
                miles = km / 1.609;
                System.out.printf("O valor %1f em milhas é: %1f\n",km, miles);
            }
        } catch (Exception e){
            System.out.println("Km tem de ser representado por digitos");
        }
    }
}
