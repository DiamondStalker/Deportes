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
    
    public static String Eldeporteexiste = "</html> "
            + "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('El deporte ya existe')\n"
            + "    window.location.href = 'administrador.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n";
    public static String Noexisteentrenador = "</html> "
            + "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('El entrenador no existe')\n"
            + "    window.location.href = 'administrador.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n";
    
    public static String Existe_entrenador = "</html> "
            + "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('El entrenador ya existe')\n"
            + "    window.location.href = 'administrador.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n";
    
    public static String Nuevo_deporte = "</html> "
            + "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('Se inserto un nuevo deporte')\n"
            + "    window.location.href = 'administrador.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n";

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
            + "    window.location.href = 'administrador.jsp';  \n"
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
            + "    window.location.href = 'administrador.jsp';  \n"
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
            + "    window.location.href = 'administrador.jsp';  \n"
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
            + "    window.location.href = 'administrador.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n"
            + "</html> ";
    
    public static String Asignacion_correcta = "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('Se asigno correctamente')\n"
            + "    window.location.href = 'administrador.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n"
            + "</html> ";
    
    public static String Asignacion_fallida = "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('Ya se encuentra asignada')\n"
            + "    window.location.href = 'administrador.jsp';  \n"
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
            + "    window.location.href = 'administrador.jsp';  \n"
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
            + "    window.location.href = 'administrador.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n"
            + "</html> ";
    public static String FaltanDatos_por_llenar= "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('Faltan datos. Por favor llenos todos los campos')\n"
            + "    window.location.href = 'administrador.jsp';  \n"
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
                                    + "<body onload=\"location.href='administrador.jsp'\">"
                                    + "</body>\n"
                                    + "</html> ";
    
    public static String usuario="<!DOCTYPE html>\n"
                                    + "<html>\n"
                                    + "<body onload=\"location.href='usuariousuario.jsp'\">"
                                    + "</body>\n"
                                    + "</html> ";
    
     public static String Estudiante_no_existe = "</html> "
            + "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<body onload=\"mensaje()\">\n"
            + "\n"
            + "<p id=\"demo\"></p>\n"
            + "\n"
            + "<script>\n"
            + "function mensaje() {\n"
            + "    alert('No existe el estudiante')\n"
            + "    window.location.href = 'administrador.jsp';  \n"
            + "}\n"
            + "</script>\n"
            + "\n"
            + "</body>\n";
}
