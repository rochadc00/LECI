package Ex1;
import java.time.LocalDateTime;

public class Data implements Comparable<Data>{
    private int dia;
    private int mes;
    private int ano;

    public Data (int dia,int mes,int ano){
        this.ano = ano;
        this.dia = dia;
        this.mes = mes;
    }
    @Override
    public String toString() {
        return dia+"/"+mes+"/"+ano;
    }

    public int getAno() {
        return ano;
    }

    public int getDia() {
        return dia;
    }

    public int getMes() {
        return mes;
    }

    public static Data currentData() {
        LocalDateTime now = LocalDateTime.now();
        return new Data(now.getDayOfMonth(), now.getMonthValue(), now.getYear());

    }

    public int compareTo(Data other){
        //return 0 if equal, <1 if smaller and >1 of greater 
		int c = ano-other.getAno();
		if(c!=0) return c;
		c = mes-other.getMes();
		if(c!=0) return c;
		return dia-other.getDia();
    }

    @Override
	public int hashCode() {
		//Número de dias desde o ano zero (kind of)
		return dia+mes*31+ano*365;}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		if (!(obj instanceof Data))
			return false;
		Data other = (Data) obj;
		if (ano != other.ano)
			return false;
		if (dia != other.dia)
			return false;
		if (mes != other.mes)
			return false;
		return true;
	}
    
}
