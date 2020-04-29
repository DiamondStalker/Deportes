/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import conexion.Conectar;
import Metodos.MensajesErrores;
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
@WebServlet(name = "Loggin", urlPatterns = {"/Loggin"})
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
                        Conectar.setCorreoF(correo);
                        
                        if (con.tipou(correo) == 1) {//Administrador 
                            
                            out.println(MensajesErrores.administrador);
                        } else {//Usuario
                            MensajesErrores.setDecente(correo);
                             out.println(MensajesErrores.usuario);
                            
                        }
//////-------------------------------------------------------------------------------------------------//////
                    } else {//La contrasena es incorrecta
                        out.println(MensajesErrores.ErrorUsuarioClave);
                    }
//////-------------------------------------------------------------------------------------------------//////
                } else {//El correo no existe
                    out.println(MensajesErrores.CorreoNExiste);
                }
//////-------------------------------------------------------------------------------------------------//////
            } else {//El correo no es valido
                out.println(MensajesErrores.ErrorCorreo);
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
