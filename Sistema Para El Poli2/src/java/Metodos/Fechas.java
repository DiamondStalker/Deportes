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
 * 
 * Clase que permite validar la categoria a partir de una fecha recibida como 
 * String
 */
public class Fechas {
    
    /**
     * Metodo que permite calcular la categoria a partir de la fecha
     * 
     * @param fechal fecha recibida
     * @return int categoria
     */
    
    
    public static int Categoria = 0;
    
    public int calcularCategoria(String fechal) {
        
        // Ponemos el formato que deseamos que tenga nuesta fecha
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-dd-MM");
        try {
            Date date = formatter.parse(fechal);// Convertimos el string a tipo dato con el formato que pusimos
            
            Calendar c1 = Calendar.getInstance(); //Creamos una variable tipo dato para luego sacar el año presente
            String annio = Integer.toString(c1.get(Calendar.YEAR)); 

            Calendar calendar = Calendar.getInstance();
            
            calendar.setTime(date);
            
            calendar.add(Calendar.YEAR, -Integer.parseInt(annio)); //HAcemso una resta de años para luego poder calcular a la categoria a la que pertenece el 
            
            
            Categoria = (calendar.getWeekYear()*-1)+1;//La multiplicamos por menos 1 para que quede positiva y este valor es el que devolvemos
            
            
            JOptionPane.showMessageDialog(null,"La categoria es"+ Categoria);
            
        } catch (Exception e) {
            System.out.println(e);
        }
            return Categoria;
            
    }
}
