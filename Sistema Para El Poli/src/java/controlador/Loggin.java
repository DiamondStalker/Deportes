/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import conexion.Conectar;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "loggin", urlPatterns = {"/loggin"})
public class Loggin extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            //Capturo los datos//
            String correo = request.getParameter("Correo");
            String clave = request.getParameter("Contrasena");
            //Capturo los datos//
            
            Conectar con = new Conectar();
            
            if (con.checkEmail(correo)) {
                if (con.validar(correo)) {
                    if (con.contrasena(correo, clave)) {
//////-------------------------------------------------------------------------------------------------////// 
                        con.setCorreoF(correo);
                        
                        if (con.tipou(correo) == 0) {//Administrador 
                            
                            out.println("<!DOCTYPE html>\n"
                                    + "<html>\n"
                                    + "<body onload=\"location.href='inicioadministrador.jsp'\">"
                                    + "</body>\n"
                                    + "</html> ");
                        } else {//Usuario
                             out.println("<!DOCTYPE html>\n"
                                    + "<html>\n"
                                    + "<body onload=\"location.href='usuariousuario.jsp'\">"
                                    + "</body>\n"
                                    + "</html> ");
                            
                        }
//////-------------------------------------------------------------------------------------------------//////
                    } else {//La contrasena es incorrecta
                        out.println("<!DOCTYPE html>\n"
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
                                + "</html> ");
                    }
//////-------------------------------------------------------------------------------------------------//////
                } else {//El correo no existe
                    out.println("<!DOCTYPE html>\n"
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
                            + "</html> ");
                }
//////-------------------------------------------------------------------------------------------------//////
            } else {//El correo no es valido
                out.println("<!DOCTYPE html>\n"
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
                                + "</html> ");
            }
        } finally {
            out.close();
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Loggin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Loggin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
