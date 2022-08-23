package Ex1;
import java.util.*;

import javax.swing.plaf.synth.SynthSplitPaneUI;

import java.io.*;
public class Ex1{
    public static void main(String[] arg)throws IOException{
        Scanner input = new Scanner(new FileReader("major.txt"));
        input.useDelimiter("\t\n.,:'‘’;?!-*{}=+&/()[]”“\"\'");

        // treeMap organiza as palavras por alfabeto, dando uma melhor noção de localização
        TreeMap<String, TreeMap<String,Integer>> map = new TreeMap<String, TreeMap<String,Integer>>();
        String anterior = null;
        String word;
        // percorre todas as palavras no ficheiro major
        while (input.hasNext()){   
            word = input.next().toLowerCase();  // todas as palavras passam ou são em minúsculas
            if (word.length() > 2){             // aceitam-se apenas palavras com mais de 2 dígitos
                // System.out.println(map);
                // System.out.println(map.get(word));
                if (map.get(word) == null){     // se o valor(key) das palavras for null
                    // Create map with keys only
                    map.put(word, new TreeMap<String,Integer>());   // adiciona a palavra em map e cria um treemap para essa mesma palavra

                }
                if (anterior!=null){    // sendo a palavra diferente de nula
                    // Add Values to keys
                    TreeMap<String,Integer> par = map.get(anterior);    // vai se buscar a key associada a essa palavra
                    // System.out.println(map);
                    // System.out.println(par+"\n\n");

                    // o valor das keys de todas as palavras inseridas em par são inicialmente null, logo entram sempre neste if
                    if (par.get(anterior)==null){ // lê a primeira palavra 
                        par.put(word,1);    // coloca a palavra que aparece depois da guardada em anterior com o valor 1 como key
                    }
                    // caso se veja uma palavra repetida(lida anteriormente e atribuída com key), então fazemos este if
                    else{
                        int valor = par.get(anterior);
                        par.put(anterior, valor+1);
                    }
                }
                anterior=word;  // palavra que era depois (word) passa a atual (antiga)
            }
            
        }
        System.out.println(map);

    }
}
