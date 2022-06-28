package aula03;
import java.util.Scanner;
import java.lang.Math;

public class Ex3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n=-1;
        double m;
        while (n<0){ 
        System.out.print("Inserir valor: ");
        n = sc.nextInt();
        }
       
        m = Math.sqrt(n);
        if (n==2){
            System.out.println("True");
        }else if (n==1){
            System.out.println("False");
        }else if (n%2 == 0){
            System.out.println("False");
        }else if (m>=3){
            for (int i = 3; i<m ; i+=2){
                if (n%i == 0){
                    System.out.println("False");     
                    break;       
                }
            }
            System.out.println("True");
        }
        
        
        

        
        sc.close();
    }
}
