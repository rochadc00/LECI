package ex5_2;
public class Date {
    private int day;
    private int month;
    private int year;

    Date(int day, int month, int year){
        this.set(day, month, year);
    }

    public void set(int day, int month, int year){
        if(valid(day, month, year)){
            this.day = day;
            this.month = month;
            this.year = year;
        }
    }

    public int getDay(){
        return day;
    }
    public int getMonth(){
        return month;
    }
    public int getYear(){
        return year;
    }

    public static boolean validMonth(int month){
        return month>=1 && month<=12;
    } 
    
    public static int monthDays(int month, int year){
        switch(month){
            case 1: return 31;
            case 2:
                if(year%4==0 || year%400==0){
                    return 29;
                }
                else{
                    return 28;
                }
            case 3: return 31;
            case 4: return 30;
            case 5: return 31;
            case 6: return 30;
            case 7: return 31;
            case 8: return 31;
            case 9: return 30;
            case 10:return 31;
            case 11:return 30;
            case 12:return 31;
            default:return 0;
        }
    } 

    public static boolean leapYear(int year) {
		return ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0);
	}

    public static boolean valid(int day, int month, int year){
        if(month<1 || month>12){ 
            return false;
        }    
        if(day<1 || day>monthDays(month, year)){
            return false;
        }
        return true;
    }

    public void increment(int days){
        for(int i=1; i<=days; i++){
            if(this.day == monthDays(this.month, this.year)){
                this.day = 1;
                if(this.month == 12){
                    this.month = 1;
                    this.year++;
                }
                else{
                    this.month++;
                }
            }
            else{
                this.day++;
            }
        }    
    }

    public void decrement(int days){
        for(int i=1; i<=days; i++){
            if(this.day == 1){
                if(this.month == 1){
                    this.month = 12;
                    this.year--;
                }
                else{
                    this.month--;
                }
                this.day = monthDays(this.month, this.year);
            }
            else{
                this.day--;
            }
        }
    }

    public String toString() {
		return String.format("%04d-%02d-%02d", this.year, this.month, this.day);
	}

}
