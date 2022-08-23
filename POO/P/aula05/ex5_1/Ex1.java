package ex5_1;
import java.io.IOException;
import java.util.Scanner;
public class Ex1 {
    public static final Scanner sc = new Scanner(System.in);
	public static void main(String[] args) throws IOException {
		Date date = new Date(1, 1, 0);

        while(true){
            System.out.println("Escolha uma das opções: ");
            System.out.println("-----------------------");
            System.out.println("1 - Criar nova data ");
            System.out.println("2 - Mostrar a data corrente ");
            System.out.println("3 - Incrementar a data ");
            System.out.println("4 - Decrementar a data ");
            System.out.println("0 - Sair ");
            System.out.println("-----------------------");
            
            System.out.println("Opção: ");
            int option = sc.nextInt();
            
            switch(option){
                case 1:
                    System.out.println("Insira o dia: ");
                    int day = sc.nextInt();
                    System.out.println("Insira o mês: ");
                    int month = sc.nextInt();
                    System.out.println("Insira o ano: ");
                    int year = sc.nextInt();
                    date = new Date(day, month, year);
                    break;
                case 2:
                    System.out.println(date);
                    break;
                case 3:
                    System.out.println("Numero de dias a incrementar: ");
                    int days = sc.nextInt();
                    date.increment(days);
                    break;
                case 4:
                    System.out.println("Numero de dias a decrementar: ");
                    int daysy = sc.nextInt();
                    date.decrement(daysy);
                    break;
                case 0:
                    break;
            }
            
        }
    }    
}
