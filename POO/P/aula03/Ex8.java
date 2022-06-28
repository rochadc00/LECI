package aula03;
import java.util.Scanner;
import java.lang.Math;

public class Ex8 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double notaF;
        int low=0, high=20;
        System.out.println(String.format("%6s %6s %6s","notaT","notaP","notaF"));    
        for (int i=0;i<=16;i++){
            double notaP = (double) (Math.random()*(high-low))+low;
            double notaT = (double) (Math.random()*(high-low))+low;
            notaF = 0.4 * notaT +0.6* notaP;
            notaF = Math.round(notaF);
            System.out.println(String.format("%6.1f %6.1f %6.0f",notaT,notaP,notaF)); 
        }
              
        sc.close();
    }
}
