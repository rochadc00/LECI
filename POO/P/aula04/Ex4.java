package aula04;
import java.util.Scanner;


public class Ex4 {
    public static int[] input(){
        int year, month, first;
        Scanner sc = new Scanner(System.in);
        System.out.print("Introduzir ano: ");
        year = sc.nextInt();
        System.out.print("Introduzir mes: ");
        month = sc.nextInt();
        System.out.println("Introduzir primeiro dia ((1 = Segunda, 2 = Terça, 3 = Quarta, 4 = Quinta, 5= Sexta, 6 = Sábado, 7 = Domingo): ");
        first = sc.nextInt();
        sc.close();
        int[] arr = {year,month,first};
        return arr;
       
    }
    public static String printMonth(int year, int month, int First) {
 
        String[] months = { "", "   January", "   February", "   March", "   April", "   May", "   June", "   July", "   August", "   September", "   October", "   November", "   December" };
        int[] days = { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
        String daysDisplay = "Su  Mo  Tu  We  Th  Fr  Sa";
 
      
        int d = First;

        if (year%4==0 && year%100!=0 && year%400==0){
            days[2] = 29;
        }else{
            days[2] = 28;
        }
        
 
        // print calendar header
        System.out.println("   " + months[month] + " " + year);
        System.out.println(daysDisplay);
 
        // print the calendar
        for (int i = 0; i < d; i++)
            System.out.print("    ");
        for (int i = 1; i <= days[month]; i++) {
            System.out.printf("%2d  ", i);
            if (((i + d) % 7 == 0) || (i == days[month]))
                System.out.println();
        }
 
        return "";
 
    }
 
    public static void main(String[] args) {
        int[] arr = input();

        System.out.print(printMonth(arr[0], arr[1], arr[2]));
    }

}

    

