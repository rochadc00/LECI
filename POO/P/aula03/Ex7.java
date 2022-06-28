package aula03;
import java.util.Scanner;
import java.lang.Math;

public class Ex7 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int c=0, valor=-1, randomInt;
        
        System.out.print("Queres jogar? S/N  ");
        String resposta = sc.next();
        while (resposta.equals("S")){
            double randomNumber = Math.random();        
            randomNumber = randomNumber*100 +1;
            randomInt = (int) randomNumber;     
            while (valor != randomInt){
                System.out.print("Inserir valor: ");
                valor = sc.nextInt();
                if (valor < randomInt){
                    System.out.println("Baixo");
                    c++;
                }else if (valor > randomInt){
                    System.out.println("Alto");
                    c++;
                }
            }
            if (valor == randomInt){  
                c++;
                System.out.println("Conseguiste em "+c+" tentativa(s)");   
                valor = -1;       
            }
            System.out.println("Queres jogar outra vez? S/N");
            resposta = sc.next();
        }
        sc.close();
    } 

}
