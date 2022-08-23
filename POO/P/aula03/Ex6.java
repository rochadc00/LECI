package aula03;
import java.util.Scanner;
public class Ex6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int m=-1,a=-1;
        while(a<1){ // assim que se insere um ano válido(superior ou igual a 1), ele sai do while
            System.out.print("Inserir ano: ");
            a = sc.nextInt(); 
        }
        while(m<1 || m>12){ // assim que se insere um mes válido(entre 1 e 12)), ele sai do while
            System.out.print("Inserir mês: ");
            m = sc.nextInt();
        }
        if (a%4==0){  //ano bissexto
            switch (m) {
                case 2 :
                    System.out.println("29");
                    break;
                case 4 :
                    System.out.println("30");
                    break;
                case 6 :
                    System.out.println("30");
                    break;
                case 9 :
                    System.out.println("30");
                    break;
                case 11 :
                    System.out.println("30");
                    break;
                default:
                    System.out.println("31");
            }
        }else if (a%4!=0){ 
            switch (m) {
                case 2 :
                    System.out.println("Fevereiro: 28");
                    break;
                case 4 :
                    System.out.println("30");
                    break;
                case 6 :
                    System.out.println("30");
                    break;
                case 9 :
                    System.out.println("30");
                    break;
                case 11 :
                    System.out.println("30");
                    break;
                default:
                    System.out.println("31");
            }
        }
        sc.close();
        }
}
