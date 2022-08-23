import java.util.*;

public class Ex2 {
    
    public static void main(String[] arg) {
        // Create a HashMap object 
    HashMap<String, ArrayList<String>> ConjuntoTermos = new HashMap<String, ArrayList<String>>();


    // Creating ArrayLists
    ArrayList<String> cars = new ArrayList<String>();
    cars.add("Volvo");
    cars.add("Preto");

    
    // Add keys and values (Carros, {Marca,Cor})
    ConjuntoTermos.put("Carro", cars);
    ConjuntoTermos.put("Testing", new ArrayList<>(Arrays.asList("something goes here", "And here", "Also here")));
    System.out.println(ConjuntoTermos);

    // Get value from key
    System.out.println(ConjuntoTermos.get("Carro"));
    System.out.println(ConjuntoTermos.get("Carsdaro"));


    // Remove item
    ConjuntoTermos.remove("Carro");
    System.out.println(ConjuntoTermos);

    // Changing value from key
    ArrayList<String> cars1 = new ArrayList<String>();
    cars1.add("Opel");
    cars1.add("Branco");
    cars1.add("Preto");
    ConjuntoTermos.put("Carro",cars1);
    System.out.println(ConjuntoTermos);

    // HashMap Size
    System.out.println(ConjuntoTermos.size());

    // Looping with for each and only printing keys
    String s = "";
    for(String a: ConjuntoTermos.keySet()){
        s += a + "; ";
    }
    System.out.println(s);

    System.out.println(ConjuntoTermos.keySet());


    // Printing Values from HashMap

    System.out.println(ConjuntoTermos.values());

    System.out.println(FindValue(ConjuntoTermos, "Carro"));

    }
    // Alinea 2
    public static String FindValue(HashMap<String, ArrayList<String>> ConjuntoTermos, String key){
        ArrayList<String> valores = ConjuntoTermos.get(key);
		return valores.get(randomNumber(valores.size()));
    }

    public static int randomNumber(int max) {
		//de 0 até max exclusive
		Random r = new Random();
		return r.nextInt(max);
	}

}
