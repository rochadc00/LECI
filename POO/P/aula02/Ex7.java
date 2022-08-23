package aula02;
import java.lang.Math;
import java.util.*;

/*ATENÇÃO: MELHORIAS NO CÓDIGO FORAM FEITAS ATÉ AO EXERCÍCIO 3. Segundo o professor Carlos Bastos, não era necessário mostrar as mesmas melhorias em todos os exercícios, ficando implicito o conhecimento destas em alguns exemplos*/

public class Ex7 {
        public static void main(String[]args){
            Scanner sc = new Scanner (System.in);

            double xp1, yp1, xp2, yp2, distancia;

            System.out.print("Introduza as coordenadas do p1: ");
            xp1 = sc.nextDouble();
            yp1 = sc.nextDouble();

            System.out.print("Introduza as coordenadas do p2: ");
            xp2 = sc.nextDouble();
            yp2 = sc.nextDouble();

            distancia = Math.sqrt(Math.pow((xp2-xp1), 2) + Math.pow((yp2-yp1), 2));

            System.out.println("Distancia: " + distancia);

            sc.close();
        }
    
}
