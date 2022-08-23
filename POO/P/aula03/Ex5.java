package aula03;
import java.util.Scanner;
public class Ex5 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double M=-1, TJ=-1, R;
        while(M%1000 != 0){
            System.out.print("Inserir Montante: ");
            M = sc.nextDouble();
        }
        while(TJ<0 || TJ>5){
            System.out.print("Inserir Taxa de juro mensal: ");
            TJ = sc.nextDouble();
        }
        R = M+M*TJ/100;
        System.out.println("1 Mês: "+R);
        for (int i=1; i<=12; i++){
            R = R+R*TJ/100;
            System.out.println(String.format("%d Mês: %.2f",i,R));
        }
        sc.close();
        }
}
