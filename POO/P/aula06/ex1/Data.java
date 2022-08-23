package ex1;
import java.time.LocalDateTime;

public class Data {
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
    
}
