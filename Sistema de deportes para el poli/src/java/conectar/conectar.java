/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.swing.JOptionPane;

/**
 *
 * @author user
 */
public class conectar {

    Connection conect = null;

    public static String correof = "";

    public String getCorreof() {
        return correof;
    }

    public void setCorreof(String correof) {
        this.correof = correof;
    }

    public Connection conexion() {

        try {
            //Cargamos el Driver MySQL
            Class.forName("com.mysql.jdbc.Driver");
            Class.forName("org.gjt.mm.mysql.Driver");
            conect = DriverManager.getConnection("jdbc:mysql://localhost/poli?"
                    + "user=root&password=");
            System.out.println("Se conecto");

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(conectar.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("No se conecto");
        } catch (SQLException ex) {
            Logger.getLogger(conectar.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("No se conecto");
        }

        return conect;
    }

    //Validar el correo//
    public boolean checkEmail(String email) {
        if (correo_invalido(email)) {
            System.out.println("Correo no valido");
        } else {
            // Establecer el patron
            Pattern p = Pattern.compile("[-\\w\\.]+@[\\.\\w]+\\.\\w+");

            // Asociar el string al patron
            Matcher m = p.matcher(email);

            // Comprobar si encaja
            return m.matches();
        }

        return false;
    }

    public static String[] invalidos = new String[]{"example", "example@.com.com",
        "exampel101@test.a", "exampel101@.com", ".example@test.com",
        "example**()@test.com", "example@%*.com",
        "example..101@test.com", "example.@test.com",
        "test@example101.com", "example@test@test.com",
        "example@test.com.a5"};

    public static boolean correo_invalido(String correo) {
        for (int i = 0; i < invalidos.length; i++) {
            if (correo.equalsIgnoreCase(invalidos[i])) {
                return true;
            }
        }

        return false;

    }
    //------------------------------------------------//

    // Validacion correo con la base de daros//
    public boolean validar(String correo) {
        boolean esta = false;
        String clave = "";

        try {

            Connection cn = conexion();

            PreparedStatement pstm = cn.prepareStatement(" SELECT Clave"
                    + " FROM usuario "
                    + " WHERE e_mail = '" + correo + "'");
            //Se crea un objeto donde se almacena el resultado
            //Y con el comando executeQuery se ejecuta la consulta en la base de datos
            ResultSet res = pstm.executeQuery();
            //Recorre el resultado para mostrarlo en los jtf
            while (res.next()) {
                //jTF_identificacion.setText(res.getString( "id_persona" ));
                clave = (res.getString("Clave"));

            }

            if (clave.equals("")) {
                esta = false;
            } else {
                esta = true;
            }
            res.close();

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "El correo no existe");
            System.err.println(e.getMessage());
        }

        return esta;
    }

    public boolean contrasena(String correo, String contrasena) {
        boolean esta = false;

        String clave = "";

        try {

            Connection cn = conexion();

            PreparedStatement pstm = cn.prepareStatement(" SELECT Clave"
                    + " FROM usuario"
                    + " WHERE e_mail = '" + correo + "'");
            //Se crea un objeto donde se almacena el resultado
            //Y con el comando executeQuery se ejecuta la consulta en la base de datos
            ResultSet res = pstm.executeQuery();
            //Recorre el resultado para mostrarlo en los jtf
            while (res.next()) {
                //jTF_identificacion.setText(res.getString( "id_persona" ));
                clave = (res.getString("Clave"));

            }

            if (contrasena.equals(clave)) {
                esta = true;
            } else {
                esta = false;
            }
            res.close();

        } catch (SQLException e) {

        }

        return esta;
    }

    //------------------------------------------------//
    //Mirar que tipo de perfil es//
    public int tipou(String correo) {
        int h = 0;
        try {

            Connection cn = conexion();

            PreparedStatement pstm = cn.prepareStatement(" SELECT perfil"
                    + " FROM usuario "
                    + " WHERE email = '" + correo + "'");
            //Se crea un objeto donde se almacena el resultado
            //Y con el comando executeQuery se ejecuta la consulta en la base de datos
            ResultSet res = pstm.executeQuery();
            //Recorre el resultado para mostrarlo en los jtf
            while (res.next()) {
                //jTF_identificacion.setText(res.getString( "id_persona" ));
                h = (res.getInt("perfil"));

            }

            res.close();

        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return h;
    }
    //------------------------------------------------//

    public int clases(String id_sala, String estado, String fecha, int reserva, String equipo, String hora,String Descripcion) {
        ////Crear Reserva
        int resultado = 0;
        try {

            Connection cn = conexion();
            PreparedStatement rs = cn.prepareStatement("INSERT INTO sala"
                    + "(id_sala,estado,Fecha,reserva_idreserva,id_equipo,Hora,Descripcion)"
                    + "VALUES (?,?,?,?,?,?,?)");

            rs.setString(1, id_sala);
            rs.setString(2, estado);
            rs.setString(3, fecha);
            rs.setInt(4, reserva);
            rs.setString(5, equipo);
            rs.setString(6, hora);
            rs.setString(7, Descripcion);

            rs.executeUpdate();
            resultado = 1;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return resultado;
    }
}
