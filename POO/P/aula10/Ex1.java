import java.util.*;

public class Ex1 {
    
    public static void main(String[] arg) {
        // Create a HashMap object 
    HashMap<String, String> ConjuntoTermos = new HashMap<String, String>();

    // Add keys and values (Cor, Hex_RGB)
    ConjuntoTermos.put("Branco", "000000");
    ConjuntoTermos.put("Preto", "ffffff");
    ConjuntoTermos.put("Red", "ff0000");
    ConjuntoTermos.put("Blue", "0000ff");
    ConjuntoTermos.put("Green", "00ff00");
    System.out.println(ConjuntoTermos);

    // Get value from key
    System.out.println(ConjuntoTermos.get("Branco"));

    // Remove item
    ConjuntoTermos.remove("Preto");
    System.out.println(ConjuntoTermos);

    // Changing value from key
    ConjuntoTermos.put("Green","090909");
    System.out.println(ConjuntoTermos);

    // HashMap Size
    System.out.println(ConjuntoTermos.size());

    // Looping with for each and only printing keys
    String s = "";
    for(String a: ConjuntoTermos.keySet()){
        s += a + "; ";
    }
    System.out.println(s);

    // Looping with for each and only printing Values
    String d = "";
    for(String a: ConjuntoTermos.values()){
        d += a + "; ";
    }
    System.out.println(d);

    // Clear HashMap
    ConjuntoTermos.clear();
    System.out.println(ConjuntoTermos);

    }

}
