package Ex1;
import java.util.*;
public class ALDemo {
    public static void main(String[] args) {
        ArrayList<Integer> c1 = new ArrayList<>();
        for(int i= 10; i<= 100; i+=10) 
            c1.add(i);
        System.out.println("Size: "+ c1.size());
        for(int i= 0; i< c1.size(); i++) 
            System.out.println("Elemento: "+ c1.get(i));
        ArrayList<String> c2= new ArrayList<>();
        c2.add("Vento");
        c2.add("Calor");
        c2.add("Frio");
        c2.add("Chuva");
        System.out.println(c2);
        Collections.sort(c2);
        System.out.println(c2);
        c2.set(3, "Darkness");
        System.out.println(c2.subList(0, 2));
        c2.remove("Frio"); 
        c2.remove(1);
        System.out.println(c2);
        System.out.println(c2.contains("Veto"));
        System.out.println("Is the list empty? "+c2.isEmpty());
        System.out.println(c2.lastIndexOf("Calor"));
        System.out.println(c2.indexOf("Vento"));
        
        c2.removeAll(c2);
        System.out.println(c2);




        //c3

        Set<Pessoa> c3 = new HashSet<>();
        c3.add(new Pessoa("Manu1", 12345, new Data(10,12,1900)));
		c3.add(new Pessoa("Manu2", 123456, new Data(23,9,1589)));
		c3.add(new Pessoa("Manu3", 1234567, new Data(10,3,2021)));
		c3.add(new Pessoa("Manu4", 12345678, new Data(17,5,2021)));
		c3.add(new Pessoa("Manu5", 123456789, new Data(13,10,2018)));
        c3.add(new Pessoa("Manu5", 123456789, new Data(13,10,2018)));
        c3.add(new Pessoa("Manu5", 123456789, new Data(13,10,2018)));
        c3.add(new Pessoa("Manu5", 123456789, new Data(13,10,2018)));
        c3.add(new Pessoa("Manu5", 123456789, new Data(13,10,2018)));
        c3.add(new Pessoa("Manu5", 123456789, new Data(13,10,2018)));
        System.out.println(c3);

        //c4

        Set<Data> c4 = new TreeSet<>();
        Data d1 = new Data(10, 12, 1990);
        Data d2 = new Data(7,9,1990);
        System.out.println(d1.compareTo(d2));
        c4.add(d1);
        c4.add(d2);
        c4.add(new Data(13,10,2018));
        c4.add(new Data(17,5,2021));
        c4.add(new Data(18,5,2021));
        c4.add(new Data(18,5,2021));
        System.out.println(c4);


    }
}