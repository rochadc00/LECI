package aula03;
import java.util.Scanner;
import java.lang.Math;

public class Ex1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double notaT=-10, notaP=-10, notaF;

        System.out.println("ATENÇÃO: Divisão deve ser feita com , em números entre ");
        while (notaT<0 || notaT>20){
            System.out.print("Inserir notaT: ");
            notaT = sc.nextDouble();
        } 
        while (notaP<0 || notaP>20){
            System.out.print("Inserir notaP: ");
            notaP = sc.nextDouble();
        } 
        
        notaF = 0.4 * notaT +0.6* notaP;
        notaF = Math.round(notaF); // it gives the int number more close
        
        if (notaT<7.0 || notaP<7.0){
            System.out.println("reprovado por nota minima");
        } else if(notaF < 9.5) {
            System.out.println("reprovado por nota final inferior a 9.5");
        } else{
            System.out.println(notaF);
        }

        sc.close();
    }
}
