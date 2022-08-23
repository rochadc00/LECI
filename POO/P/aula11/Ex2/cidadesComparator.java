package Ex2;

import java.util.*;

public class cidadesComparator implements Comparator<String>{
	
	private Map<String, Integer> base;

    public cidadesComparator(Map<String, Integer> base) {
        this.base = base;
    }
    
    public int compare(String a, String b) {
    	// Returns a negative integer, zero, or a positive integer as the first argument is less than, equal to, or greater than the second.
    	//Como queremos ordem decrescente, vamos fazer o inverso
        if (base.get(a) > base.get(b)) {
            return -1;
        } else {
            return 1;
        } // returning 0 would merge keys
    }

}
