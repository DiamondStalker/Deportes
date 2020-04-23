/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Metodos.MensajesErrores;
import Metodos.Textos;
import conexion.Conectar;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author user
 */
@WebServlet(name = "deporte", urlPatterns = {"/deporte"})
public class deporte extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String Codigo = request.getParameter("codigo");
            String Nombre_deportes = request.getParameter("deporte");
            /*
             * Fragmento de codigo que nos permite poner la primera letra
             * de un texto en mayuscula
             */
            Nombre_deportes = Character.toUpperCase(Nombre_deportes.charAt(0)) + Nombre_deportes.substring(1, Nombre_deportes.length());
            
            Conectar Con = new Conectar();
            /*
             * Antes des insertar tenemos que preguntar que el deportes no este
             */
            int Existe_deporte = Con.Existe_deporte(Nombre_deportes);
            
            if(Existe_deporte == 0){// Si el valor que devuelte es !0 es porque el deporte no existe y se puede insertar
                Con.Insertar_deporte(Codigo,Nombre_deportes);
                Textos txt = new Textos();
                txt.Crear_carpeta_deporte(Nombre_deportes);//Creamos la carpeta del nuevo deporte
                out.println(MensajesErrores.Nuevo_deporte);
            }else{
                out.println(MensajesErrores.Eldeporteexiste);
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
