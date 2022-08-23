package ex5_2;
public class Calendary {
    
    private int startDay;
    private int year;

    Calendary(int startDay, int year){
        this.startDay = startDay;
        this.year = year;
    }

    public int firstWeekdayOfYear(){
        return this.startDay;
    }

    public int getyear(){
        return this.year;
    }

    
	public String printMonth(int month) {
		assert month>=1 && month<=12;
		int totalDays = 0;
		for (int i = 1; i < month; i++) {
			totalDays += Date.monthDays(i, this.year);
		}
		return makeWeakCalendar(month, (totalDays+this.startDay-1)%7+1);
	}

	public String toString() {
		String r = "";
		for (int i = 1; i <= 12; i++) {
			r += printMonth(i);
		}
		return r;
	}

	private String makeWeakCalendar(int month, int startDay) {
		String[] monthNames = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"};

		String r = "\n";

		String header = monthNames[month-1] + " " + this.year;
		for(int i = 0; i < (20-header.length())/2 ; i++) {
			r += " ";
		}
		r += header + "\n";

		r += "Su Mo Tu We Th Fr Sa\n";

		// preenche os dias em branco
		for(int i = 1; i < startDay; i++)
			r += "   ";
		
		int x = startDay-1;
		for(int i = 1; i <= Date.monthDays(month, this.year); i++) {
			r += String.format("%2d ", i);
			x += 1;
			if( x>=7 ) {
				x = 0;
				r += "\n";
			}
		}

		return r + "\n";
	}

}
