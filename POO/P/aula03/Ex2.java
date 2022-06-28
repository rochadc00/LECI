package aula03;
import java.util.Scanner;


public class Ex2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int valor;
        System.out.print("Inserir valor: ");
        valor = sc.nextInt();
        while (valor>=0){
            System.out.println(valor);
            valor --;
        }
        
        sc.close();
    }
}
