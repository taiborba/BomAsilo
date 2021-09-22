package util;
import java.util.Calendar;

public class ConversorData {
    public static java.sql.Date conv(Calendar d){
       java.sql.Date data = new java.sql.Date(d.getTime().getTime());
       return data;
    }
}
