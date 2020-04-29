package Metodos;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import conexion.Conectar;
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

    /*
     * Creacion, lectura y concatenacion de archivos txt para los estudaintes
     */
    public void Crear_registro_estudiante(String Id_estudiante, String Nombre_estudiante, String Apellido_estudiante, String Fecha_nacimiento) {

        String crear = "C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\web\\Registros\\Estudiantes\\" + Nombre_estudiante;
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

        String crear = "C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\web\\Registros\\Estudiantes\\" + Nombre_estudiante;
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
            f = new File("C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\web\\Registros\\Estudiantes\\" + nombre + "\\Informacion_del_estudiante.txt");
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

    public void Concatenar_acudiente(String Nombre_estudiante, String Id_acudientre, String Nombre_acudiente, String Apellido_acudiente, String Parentesco_acudiente, String Telefono, String Celular, String Direccion) {
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

    public void Concatenar_matricula(String Nombre_estudiante, String Deporte, String Fecha_nacimiento, String Horario) {
        Fechas ct = new Fechas();
        Conectar con = new Conectar();
        String temp = this.Leer_registro_estudiante(Nombre_estudiante);
        String texto = "\nMatrícula: "
                + "\n Codigo Matricula : " + con.codigo
                + "\n Deporte : " + Deporte
                + "\n Categoria : " + ct.Categoria
                + "\n Hora : " + Horario
                + "\n";
        temp = temp + texto;
        this.añadir_acudiente(Nombre_estudiante, temp);
    }

    /*
     * Creacion, lectrura y concatenacion para los registros de los Deporte_categoria_hora  
     */
    public void Crear_carpeta_deporte(String Nombre_deportes) {
        String crear = "C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\web\\Registros\\Deportes\\" + Nombre_deportes;
        File c = new File(crear);
        c.mkdirs();
        File f;
        FileWriter escritorArchivo;

        try {
            f = new File(crear);
            escritorArchivo = new FileWriter(f);
            BufferedWriter bw = new BufferedWriter(escritorArchivo);
            PrintWriter salida = new PrintWriter(bw);
            salida.close();
            bw.close();

        } catch (Exception e) {
        }
    }

    public void Crear_carpeta_deporte_categoria(String Nombre_deportes, String categoria, String hora) {
        String crear = "C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\web\\Registros\\Deportes\\" + Nombre_deportes + "\\" + categoria;
        File c = new File(crear);
        c.mkdirs();
        File f;
        FileWriter escritorArchivo;

        try {
            f = new File(crear + "\\Informacion.txt");
            escritorArchivo = new FileWriter(f);
            BufferedWriter bw = new BufferedWriter(escritorArchivo);
            PrintWriter salida = new PrintWriter(bw);

            salida.write(hora);

            salida.close();
            bw.close();

        } catch (Exception e) {
        }
    }
    
    public void Crear_archivo_categorias(String Nombre_deportes) {
        String crear = "C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\web\\Registros\\Deportes\\" + Nombre_deportes;
        File c = new File(crear);
        c.mkdirs();
        File f;
        FileWriter escritorArchivo;

        try {
            f = new File(crear + "\\Categorias.txt");
            escritorArchivo = new FileWriter(f);
            BufferedWriter bw = new BufferedWriter(escritorArchivo);
            PrintWriter salida = new PrintWriter(bw);

            salida.write("");

            salida.close();
            bw.close();

        } catch (Exception e) {
        }
    }

    public void Concatener_informacion_horario(String Deporte, String Categoria, String Horario) {
        File f;
        FileReader lectorArchivo;
        try {
            f = new File("C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\web\\Registros\\Deportes\\" + Deporte + "\\" + Categoria + "\\Informacion.txt");
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
            String Direccion = "C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\web\\Registros\\Deportes\\" + Deporte + "\\" + Categoria;
            FileWriter escritorArchivo;
            escritorArchivo = new FileWriter(f);
            BufferedWriter bw = new BufferedWriter(escritorArchivo);
            PrintWriter salida = new PrintWriter(bw);

            salida.write(l+Horario);

            salida.close();
            bw.close();
            
            br.close();
            lectorArchivo.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
    
    public void Concatener_categorias(String Deporte, String Categoria) {
        File f;
        FileReader lectorArchivo;
        try {
            f = new File("C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\web\\Registros\\Deportes\\" + Deporte + "Categorias.txt");
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
            String Direccion = "C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\web\\Registros\\Deportes\\" + Deporte + "Categorias.txt";
            FileWriter escritorArchivo;
            escritorArchivo = new FileWriter(f);
            BufferedWriter bw = new BufferedWriter(escritorArchivo);
            PrintWriter salida = new PrintWriter(bw);

            salida.write(l+Categoria);

            salida.close();
            bw.close();
            
            br.close();
            lectorArchivo.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

}
