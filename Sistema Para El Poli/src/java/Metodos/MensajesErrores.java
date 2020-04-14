/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

/**
 *
 * @author user
 */
public class MensajesErrores {

    public static String ErrorDeporte_Horario = "</html> "
            + "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('No se escojio un deporte / horario valido')\n"
            + "    window.location.href = 'inicioadministrador.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n";

    public static String ErrorParenteso = "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('No se escojio un parentesco valido para el acudiente')\n"
            + "    window.location.href = 'inicioadministrador.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n"
            + "</html> ";
    public static String ErrorParenteso2 = "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('No se escojio un parentesco valido para el segundo acudiente acudiente')\n"
            + "    window.location.href = 'inicioadministrador.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n"
            + "</html> ";

    public static String Correcto = "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('Se inserto todo correctamente')\n"
            + "    window.location.href = 'inicioadministrador.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n"
            + "</html> ";

    public static String ErrorInsertar = "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('Hubo problemas al insertar los datos')\n"
            + "    window.location.href = 'inicioadministrador.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n"
            + "</html> ";

    public static String FaltanDatos = "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('Faltan datos del acudiente dos')\n"
            + "    window.location.href = 'inicioadministrador.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n"
            + "</html> ";

    public static String ErrorUsuarioClave = "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('El usuario y/o contrasena son incorrectas')\n"
            + "    window.location.href = 'index.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n"
            + "</html> ";

    public static String CorreoNExiste = "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('El correo no existe')\n"
            + "    window.location.href = 'index.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n"
            + "</html> ";

    public static String ErrorCorreo = "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('El Correo no es valido')\n"
            + "    window.location.href = 'index.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n"
            + "</html> ";
    
    public static String administrador = "<!DOCTYPE html>\n"
                                    + "<html>\n"
                                    + "<body onload=\"location.href='inicioadministrador.jsp'\">"
                                    + "</body>\n"
                                    + "</html> ";
    
    public static String usuario="<!DOCTYPE html>\n"
                                    + "<html>\n"
                                    + "<body onload=\"location.href='usuariousuario.jsp'\">"
                                    + "</body>\n"
                                    + "</html> ";
}
