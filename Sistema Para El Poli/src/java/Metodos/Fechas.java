/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.swing.JOptionPane;

/**
 *
 * @author user
 */
public class Fechas {
    
    public int Calcular_categoria(String fechal) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-dd-MM");
        int categoria=0;
        try {
            Date date = formatter.parse(fechal);
            
            
            Date Fechaa = new Date();
            Calendar c1 = Calendar.getInstance();
            String annio = Integer.toString(c1.get(Calendar.YEAR));

            System.out.println("El año actual es:"+annio);
            
            
            Calendar calendar = Calendar.getInstance();
            
            calendar.setTime(date);
            System.out.println("año del recivido: "+calendar.getWeekYear());
            
            
            calendar.add(Calendar.YEAR, -Integer.parseInt(annio));
            
            
            categoria = calendar.getWeekYear()*-1;
            System.out.println("El resultado es:"+calendar.getWeekYear());
            System.out.println("El resultado es:"+categoria);
            
            JOptionPane.showMessageDialog(null,"La categoria es"+ categoria);
            
        } catch (Exception e) {
            System.out.println(e);
        }
            return categoria;
            
    }
}
