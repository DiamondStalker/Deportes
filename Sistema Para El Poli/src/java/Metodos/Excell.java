/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.time.LocalDate;
import java.time.Month;
import java.time.format.TextStyle;
import java.util.Calendar;
import java.util.Locale;
import javax.swing.JOptionPane;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author user
 */
public class Excell {

    @SuppressWarnings("empty-statement")
    public void Exportar(String Nombrea) throws Exception {

        try {
            //Creamos una instancia tipo calendario-- esto es para obtener el mes delaño presente para 
            //Cuando se lea el archivo excel, lea  la hoja del mes actual
            // Obtenemos el mes actual
            Month mes = LocalDate.now().getMonth();
            
            // Obtenemos el nombre del mes
            String Nmes = mes.getDisplayName(TextStyle.FULL, new Locale("es", "ES"));
            
            // Convierte a mayúscula la primera letra del nombre.
            String primeraLetra = Nmes.substring(0, 1);
            String mayuscula = primeraLetra.toUpperCase();
            String demasLetras = Nmes.substring(1, Nmes.length());
            Nmes = mayuscula + demasLetras;
            
            //Direccion del archivo para poder leerlo
            FileInputStream file = new FileInputStream(new File("C:\\Users\\user\\Google Drive\\workcare2\\Sistema Para El Poli\\build\\web\\uploadFiles\\" + Nombrea));
            
            //Traemo la informacion del archivo
            XSSFWorkbook wb = new XSSFWorkbook(file);
            
            //Declaramo con cual hoja va a trabajar
            //REcibe un String con el nombre de la hoja la cual obtuvimos 
            XSSFSheet sheet = wb.getSheet(Nmes);
            
            
            //Capturamos cuantas filas tiene
            int numFilas = sheet.getLastRowNum();

            for (int a = 1; a <= numFilas; a++) {//Extraemos las filas
                //Capturamos la fila
                Row fila = sheet.getRow(a);

                String Cedula = fila.getCell(0).toString();
                String Nombre = fila.getCell(1).toString();
                String Apellido = fila.getCell(2).toString();
                String Fecha_nacimiento = fila.getCell(3).toString();
                String Id_tutuor = fila.getCell(4).toString();
                
                System.out.println(Cedula + " " + Nombre + " " + Apellido + " " + Fecha_nacimiento + " " + Id_tutuor);
                JOptionPane.showMessageDialog(null, Cedula + " " + Nombre + " " + Apellido + " " + Fecha_nacimiento + " " + Id_tutuor);

                //Cuantas columnas tiene
                //int numCols = fila.getLastCellNum();
                /*for (int b = 0; b < numCols; b+=numCols) {
                 //Capturamos el valor de la fila con la columna
                 // el tamaño es de 18
                 Cell celda = fila.getCell(b);
                 String Nombre = fila.getCell(0).toString();
                 JOptionPane.showMessageDialog(null, Nombre);
                    
                 //Miramos que tipo de dato es
                 switch (celda.getCellTypeEnum().toString()) {
                 case "NUMERIC":
                 System.out.print(celda.getNumericCellValue() + " ");
                 break;
                        
                 case "STRING":
                 System.out.print(celda.getStringCellValue() + " ");
                 break;
                        
                 case "FORMULA":
                 System.out.print(celda.getCellFormula() + " ");
                 break;
                 }
                    
                 }
                 */
                System.out.println("");

            }

        } catch (FileNotFoundException ex) {
            System.out.println(ex);
        }

    }
}
