package aula02;
import java.util.Scanner;

public class Ex3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double M, I, F, Q, Temp;
        try{
            System.out.print("Inserir Massa: ");
            M = sc.nextDouble();
            if(M < 0){ 
                System.out.println("ATENÇÃO: Deve colocar uma massa positiva");      
            }else{
                System.out.print("Inserir Temperatura inicial(superior a -273.17 Cº): ");
                I = sc.nextDouble();
                System.out.print("Inserir Temperatura Final(superior a -273.17 Cº): ");
                F = sc.nextDouble();
                Q = M*(F-I)*4184;
                Temp = F-I;
                System.out.println("Para aquecer "+ Temp +"Cº numa massa de " + M + " kg, são necessários " +Q+ "J de energia");
            }
        } catch (Exception e) {
            System.out.println("Temperatura e Massa têm de ser representados em digitos");
        }
        sc.close();
    }
}
