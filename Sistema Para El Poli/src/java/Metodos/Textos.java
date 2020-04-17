package Metodos;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.swing.JOptionPane;

public class Textos {
    
    /*
    * Creacion, lectura y concatenacion de archivos txt
    */

    public static String Direccion_archivo = "";

    public void Crear_registro_estudiante(String Id_estudiante, String Nombre_estudiante, String Apellido_estudiante, String Fecha_nacimiento) {
        
        String crear = Direccion_archivo + "\\Registros\\Estudiantes\\" + Nombre_estudiante;
        File c = new File(crear);
        c.mkdirs();
        File f;
        FileWriter escritorArchivo;
        Calendar cal = Calendar.getInstance();
        String fecha = cal.get(cal.DATE) + "/" + cal.get(cal.MONTH) + "/" + cal.get(cal.YEAR);
        String hora = String.valueOf(cal.get(cal.HOUR_OF_DAY));
        String minuto = String.valueOf(cal.get(cal.MINUTE));
        String segundo = String.valueOf(cal.get(cal.SECOND));
        
        try {

            f = new File(crear + "\\Informacion_del_estudiante.txt");
            escritorArchivo = new FileWriter(f);
            BufferedWriter bw = new BufferedWriter(escritorArchivo);
            PrintWriter salida = new PrintWriter(bw);

            salida.write("Informacion del usuario: "
                    + "\n Identificaion del estudiante : " + Id_estudiante
                    + "\n Nombre del estudiante : " + Nombre_estudiante
                    + "\n Apellido del estudiante : " + Apellido_estudiante
                    + "\n Fecha de nacimiento del estudiante : " + Fecha_nacimiento
                    + "\n"
                    + "\n Informacion de la creacion del registro"
                    + "\n " + fecha + "\n" + hora + ":" + minuto + ":" + segundo);

            salida.close();
            bw.close();
            JOptionPane.showMessageDialog(null, "Se creo el archivo en la ruta " + f);

        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public void añadir_acudiente(String Nombre_estudiante, String Texto_añadir) {

        String crear = Direccion_archivo + "\\Registros\\Estudiantes\\" + Nombre_estudiante;
        File c = new File(crear);
        c.mkdirs();
        File f;
        FileWriter escritorArchivo;
        Calendar cal = Calendar.getInstance();
        String fecha = cal.get(cal.DATE) + "/" + cal.get(cal.MONTH) + "/" + cal.get(cal.YEAR);
        String hora = String.valueOf(cal.get(cal.HOUR_OF_DAY));
        String minuto = String.valueOf(cal.get(cal.MINUTE));
        String segundo = String.valueOf(cal.get(cal.SECOND));

        try {

            f = new File(crear + "\\Informacion_del_estudiante.txt");
            escritorArchivo = new FileWriter(f);
            BufferedWriter bw = new BufferedWriter(escritorArchivo);
            PrintWriter salida = new PrintWriter(bw);

            salida.write("\n " + Texto_añadir
                    + "\n Se añadio un acudiente"
                    + "\n " + fecha 
                    + "\n " + hora + ":" + minuto + ":" + segundo
                    + "\n ");

            salida.close();
            bw.close();
            JOptionPane.showMessageDialog(null, "Se creo el archivo en la ruta " + f);

        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public String Leer_registro_estudiante(String nombre) {
        /*El parametro leer indica el nombre del archivo
         por ejemplo test.doc*/
        File f;
        FileReader lectorArchivo;
        try {
            f = new File(Direccion_archivo + "\\Registros\\Estudiantes\\" + nombre + "\\Informacion_del_estudiante.txt");
            lectorArchivo = new FileReader(f);
            BufferedReader br = new BufferedReader(lectorArchivo);
            String l = "";
            String aux = "";
            while (true) {
                aux = br.readLine();
                if (aux != null) {
                    l = l + aux + "\n";
                } else {
                    break;
                }
            }
            br.close();
            lectorArchivo.close();
            return l;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public void Concatenar_acudiente(String Nombre_estudiante,String Id_acudientre, String Nombre_acudiente, String Apellido_acudiente, String Parentesco_acudiente, String Telefono, String Celular, String Direccion) {
        String temp = this.Leer_registro_estudiante(Nombre_estudiante);
        String texto = "\nInformacion del acudiente : "
                    + "\n Identificaion del acudiente : " + Id_acudientre 
                    + "\n Nombre : " + Nombre_acudiente 
                    + "\n Apellido : " + Apellido_acudiente
                    + "\n Apellido : " + Apellido_acudiente
                    + "\n Parentesco : " + Parentesco_acudiente
                    + "\n Telefono  : " + Apellido_acudiente
                    + "\n Celular  : " + Apellido_acudiente
                    + "\n Direccion  : " + Apellido_acudiente
                    + "\n";
        temp = temp + texto;
        this.añadir_acudiente(Nombre_estudiante, temp);
    }
    
    public void Concatenar_matricula(String Nombre_estudiante,String Deporte,String Fecha_nacimiento,String Horario){
        Fechas categoria = new Fechas();
        categoria.calcularCategoria(Fecha_nacimiento);
        String temp = this.Leer_registro_estudiante(Nombre_estudiante);
        String texto = "\nMatrícula: "
                    + "\n Deporte : " + Deporte 
                    + "\n Categoria : " + categoria 
                    + "\n Hora : " + Horario 
                    + "\n";
        temp = temp + texto;
        this.añadir_acudiente(Nombre_estudiante, temp);
    }
}
