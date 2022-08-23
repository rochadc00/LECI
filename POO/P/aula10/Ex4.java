import java.io.*;
import java.util.*;
public class Ex4 {
    public static void main(String[]args) throws IOException{
        Scanner input = new Scanner(new FileReader("words.txt"));
        HashMap<String, ArrayList<String>> restricted_words = new HashMap<String, ArrayList<String>>();
        ArrayList<String> new_word = new ArrayList<String>();
        ArrayList<String> end_s = new ArrayList<String>();
        ArrayList<String> All_words = new ArrayList<String>(Arrays.asList());
        while(input.hasNext()){
            String word = input.next();
            System.out.println(word);
            //  a)
            All_words.add(word);
            //  b)
            if (word.length() > 2){
                new_word.add(word);
            }
            // c)
            int n = word.length()-1;
            if (word.charAt(n) == 's'){
                end_s.add(word);
            }
        }
        restricted_words.put("Palavras com 2+ chars", new_word);
        restricted_words.put("Palavras terminadas em s", end_s);
        System.out.println(restricted_words);
        // d)
        System.out.println(All_words);
        for(int i = 0; i < All_words.size(); i++){
            if (All_words.get(i).matches(".*\\d.*")){   // ou palavras ou numeros
                All_words.remove(i);
            }
        } 
        System.out.println(All_words);   
    }
}
