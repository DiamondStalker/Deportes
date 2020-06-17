/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

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
@WebServlet(name = "Insertar", urlPatterns = {"/Insertar"})
public class Insertar extends HttpServlet {

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
              String c1 = request.getParameter("Fechan");
            String Sdeporte = request.getParameter("Sdeporte");//Para no capturar todos los datos de una, primero capturamos el dato deporte para validar si este esta bien capturamos los demas
            //Preguntamos si escojio un deporte valido
            if (Sdeporte.equalsIgnoreCase("Seleccione un deporte")) {
                //No escojio un deporte valido
                out.println("<!DOCTYPE html>\n"
                        + "<html>\n"
                        + "<body onload=\"mensaje()\">\n"
                        + "\n"
                        + "<p id=\"demo\"></p>\n"
                        + "\n"
                        + "<script>\n"
                        + "function mensaje() {\n"
                        + "    alert('No se escojio un deporte valido')\n"
                        + "    window.location.href = 'inicioadministrador.jsp';  \n"
                        + "}\n"
                        + "</script>\n"
                        + "\n"
                        + "</body>\n"
                        + "</html> ");
            } else {
                String Seleccione_parentesco = request.getParameter("Seleccione_parentesco");
                if (Seleccione_parentesco.equalsIgnoreCase("Seleccione parentesco")) {
                    //No seleeciono un parentesco valido
                    out.println("<!DOCTYPE html>\n"
                            + "<html>\n"
                            + "<body onload=\"mensaje()\">\n"
                            + "\n"
                            + "<p id=\"demo\"></p>\n"
                            + "\n"
                            + "<script>\n"
                            + "function mensaje() {\n"
                            + "    alert('No se escojio un parentescovalido')\n"
                            + "    window.location.href = 'inicioadministrador.jsp';  \n"
                            + "}\n"
                            + "</script>\n"
                            + "\n"
                            + "</body>\n"
                            + "</html> ");
                } else {
                    //Capturamos los demas datos

                    String Ides = request.getParameter("ides");
                    String Nes = request.getParameter("NombreEstudiante");
                    String Aes = request.getParameter("ApellidoEstudiante");
                  
                    String idacu1 = request.getParameter("idacu1");
                    String ingresarac2 = request.getParameter("ingresarac2");
                    
                    int opc1 = Integer.parseInt(request.getParameter("ingresarac2"));

                    //Preguntamos si habilito el check para el segundo acudiente
                    //Si ese es el caso capturamos los datos
                    JOptionPane.showMessageDialog(null, opc1);

                    switch (ingresarac2) {
                        case "on":
                            out.println("<!DOCTYPE html>\n"
                                    + "<html>\n"
                                    + "<body onload=\"mensaje()\">\n"
                                    + "\n"
                                    + "<p id=\"demo\"></p>\n"
                                    + "\n"
                                    + "<script>\n"
                                    + "function mensaje() {\n"
                                    + "    alert('Se encojio si a l dods')\n"
                                    + "    window.location.href = 'inicioadministrador.jsp';  \n"
                                    + "}\n"
                                    + "</script>\n"
                                    + "\n"
                                    + "</body>\n"
                                    + "</html> ");
                            break;
                    }
                }
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
