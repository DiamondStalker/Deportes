/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Metodos.MensajesErrores;
import conexion.Conectar;
import conexion.Mensaje;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "insertardocente", urlPatterns = {"/insertardocente"})
public class insertardocente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Conectar Con = new Conectar();
            /*
             * Antes de insertar tenemos que verificar que el docente no exista
             */
            String Id_docente = request.getParameter("Id-docente");
            int existe = Con.Existe_entrenador(Id_docente);
            if (existe != 0) {//El docente ya existe
                out.println(MensajesErrores.Existe_entrenador);
            } else {//Como no existe procederemos a capturar el resto de datos para insertarlo como docente
                String Nombre = request.getParameter("Nombre");
                String Apellido = request.getParameter("Apellido");
                String Telefono = request.getParameter("Telefono");
                String Celular = request.getParameter("Celular");
                String Correo = request.getParameter("email");
                
                Con.persona(Id_docente, Nombre, Apellido, Telefono, Celular);
                Con.Insertar_docente(Id_docente);
                

                Mensaje msg = new Mensaje();
                String Codigo = "";
                Random rm = new Random();
                for (int i = 0; i < 5; i++) {
                    Codigo += rm.nextInt(10);
                }
                msg.mandarVerificacion(Codigo,Correo );
                Con.Insertar_usuario(Correo,Codigo,Id_docente);
                out.println(MensajesErrores.Correcto);
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
