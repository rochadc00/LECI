package aula02;
import java.util.*;

/*ATENÇÃO: MELHORIAS NO CÓDIGO FORAM FEITAS ATÉ AO EXERCÍCIO 3. Segundo o professor Carlos Bastos, não era necessário mostrar as mesmas melhorias em todos os exercícios, ficando implicito o conhecimento destas em alguns exemplos*/

public class Ex6 {
        public static void main(String[]args){

            Scanner sc = new Scanner(System.in);

            int total, s, m, h, aux;
            
            System.out.print("Introduza um dado tempo em segundos: ");
            total = sc.nextInt();

            h = total/3600;
            aux = total%3600;
            m = aux/60;
            s = aux%60;

            System.out.printf("%d:%d:%d\n", h, m, s);

            sc.close();
            
        }
    
}
