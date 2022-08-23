package ex5_2;
import java.io.IOException;
import java.util.Scanner;
public class Ex2 {
    public static final Scanner sc = new Scanner(System.in);
	public static void main(String[] args) throws IOException {
		Calendary calendary = new Calendary(0,1);

        while(true){
            System.out.println("Escolha uma das opções: ");
            System.out.println("-----------------------");
            System.out.println("1 - Criar novo Calendário ");
            System.out.println("2 - Mostrar Mês ");
            System.out.println("3 - Mostrar Calendário ");
            System.out.println("0 - Sair ");
            System.out.println("-----------------------");
            
            System.out.println("Opção: ");
            int option = sc.nextInt();

            switch(option){
                case 1:
                    System.out.println("Insira o ano:");
                    int year = sc.nextInt();
                    System.out.println("Insira o dia em que começa o mês: ");
                    int startDay = sc.nextInt();
                    calendary = new Calendary(startDay, year);
                    break;
                case 2:
                    System.out.println("Insira o mês pretendido: ");
                    int month = sc.nextInt();
                    System.out.println(calendary.printMonth(month));
                    break;
                case 3:
                    System.out.println(calendary);
                    break;
                
                case 0:
                    break;
            }





        }
    }

}
