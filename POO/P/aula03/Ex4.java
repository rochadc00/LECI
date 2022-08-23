package aula03;
import java.util.Scanner;

public class Ex4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);       
        System.out.println("Please enter number");
        double n1 = sc.nextDouble();
        double n = n1-1,media = n1,maxi = n1,mini = n1, ns = 1;
        while(n1!=n){
            System.out.println("Please enter number");
            n = sc.nextDouble();
            total+=n;
            ns++;
            if(n<mini)mini=n;
            if(n>mini)maxi=n;
        }
        System.out.println(String.format("Max = %.1f\nMin = %.1f\nMédia = %.1f\nTotal = %.1f",maxi,mini,(total/ns),ns));

        sc.close();
    }
}
