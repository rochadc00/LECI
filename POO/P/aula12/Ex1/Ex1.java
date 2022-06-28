package Ex1;
import java.util.*;
import java.io.*;
public class Ex1{
    public static void main(String[] args) throws IOException{
        Scanner input = new Scanner(new FileReader("Ex1/text.txt"));
        HashMap<String, Integer> Words = new HashMap<String, Integer>();
        
        // todas as palavras vão ser lidas e irão guardar num hashMap essa palavra(key) e o número de vezes que essa aparece(value)
        while (input.hasNext()){
            String[] line;
            line = input.nextLine().split(" ");
            for (String word: line){
                word = word.replace(",","");
                //System.out.println(word);
                if (Words.get(word)!=null){
                    int n =  Words.get(word);  // valor inteiro que representa o número de vezes que essa palavra existe ao longo do ciclo
                   // System.out.println(n);
                    Words.put(word, n+1);   
                }else{
                    Words.put(word, 1);
                }
            }
        }

        // vai ler os values de todas as keys e somar, obtendo o numero total de palavras repetidas e não repetidas
        int NPalavras=0;
        for (Map.Entry<String,Integer> entry : Words.entrySet()){
            int value = entry.getValue();
            NPalavras += value;
        }
        
      //  System.out.println("MAP: "+ Words.entrySet() +"\n");

        System.out.println("Numero total de Palavaras: "+NPalavras);
        System.out.println("Numero total de Palavaras Diferentes: "+Words.size());
    }
}