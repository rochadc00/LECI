package Ex2;
import java.util.*;
import java.io.*;

public class Ex2 {
    public static void main(String[] args) throws IOException{
        Scanner input = new Scanner(new FileReader("Ex2/movies.txt"));
        ArrayList<ArrayList<String>> Movies = new ArrayList<ArrayList<String>>(Arrays.asList());
        input.nextLine();
        String s = String.format("%-39s %-19s %-27s %-27s %s", "Name", "Score", "Rating", "Genre", "Duration");
        System.out.println(s);
        while (input.hasNext()){
            String[] line;
            line = input.nextLine().split("\\t");
            Movie a = new Movie(line[0], Double.parseDouble(line[1]), line[2], line[3], Double.parseDouble(line[4]));
            System.out.println(a.toString());
            ArrayList<String> t1 = new ArrayList<String>();
            for (String word: line){
                t1.add(word);
            }
            Movies.add(t1);
        }

        input.close();


        //Sorting by Title
        Collections.sort(Movies, new Comparator<ArrayList<String>> () {
        @Override
        public int compare(ArrayList<String> a, ArrayList<String> b) {
            return a.get(0).compareTo(b.get(0));
        }
        });
        System.out.println("\n"+Movies);

        //Sorting by Descending Score
        Collections.sort(Movies, new Comparator<ArrayList<String>> () {
        @Override
        public int compare(ArrayList<String> a, ArrayList<String> b) {
            return a.get(1).compareTo(b.get(1));
        }
        });
        Collections.reverse(Movies);
        System.out.println("\n"+Movies);

        //Sorting by Duration
        Collections.sort(Movies, new Comparator<ArrayList<String>> () {
        @Override
        public int compare(ArrayList<String> a, ArrayList<String> b) {
            return a.get(4).compareTo(b.get(4));
        }
        });
        System.out.println("\n"+Movies);



        //d)
        ArrayList<String> genres = new ArrayList<String>();
        for (ArrayList<String> a: Movies){
            String genre = a.get(3);
            if (genres.contains(genre)==false){
                genres.add(genre);
            }
        }
        System.out.println(genres);


        //e)
        ArrayList<ArrayList<String>> Comedy = new ArrayList<ArrayList<String>>();
        for (ArrayList<String> a: Movies){
            if (a.contains("comedy")==true){
                if (Integer.parseInt(a.get(4))>=60.0){
                    Comedy.add(a);
                }
            }
        }

        System.out.println(Comedy);

        FileWriter ComedyMovies = new FileWriter("myselection.txt");
        for (ArrayList<String> a: Comedy){
            ComedyMovies.write("\n");
            for (String word: a){
                ComedyMovies.write(word+"; ");
            }
        }
        ComedyMovies.close();





    }

    
}
