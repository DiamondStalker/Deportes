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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import static net.ucanaccess.converters.Functions.date;

/**
 *
 * @author user
 */
@WebServlet(name = "InsertarUsuario", urlPatterns = {"/InsertarUsuario"})
public class InsertarUsuario extends HttpServlet {

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
            
            MensajesErrores msg = new MensajesErrores();
            
            String Sdeporte = request.getParameter("Sdeporte");
            String horario = request.getParameter("horario");
            
             
            
            if (Sdeporte.equalsIgnoreCase("Seleccione un deporte") || horario.equalsIgnoreCase("Seleccione un horario")) {
                out.println(msg.ErrorDeporte_Horario);
            } else {
                String Seleccione_parentesco = request.getParameter("Seleccione_parentesco");
                if (Seleccione_parentesco.equalsIgnoreCase("Seleccione parentesco")) {
                    out.println(msg.ErrorParenteso);
                } else {
                    
                    String ingresarac2 = request.getParameter("pregunta");
                    String Ides = request.getParameter("ides");
                    String Nes = request.getParameter("NombreEstudiante");
                    String Aes = request.getParameter("ApellidoEstudiante");

                    String Fechan = (request.getParameter("Fechan") == null ? "" : request.getParameter("Fechan"));

                    String idacu1 = request.getParameter("idacu1");
                    String NAcudiente = request.getParameter("NAcudiente");
                    String AAcudiente = request.getParameter("aAcudiente");
                    String Telefono = request.getParameter("Telefono");
                    String celular = request.getParameter("celular");
                    String Direccion = request.getParameter("Direccion");
                    
                    

                    if (ingresarac2.equalsIgnoreCase("Si")) {//Se ecogio la opcion de ingresar al segundo acudiente

                        String Seleccione_parentesco2 = request.getParameter("Seleccione_parentesco2");

                        if (Seleccione_parentesco2.equalsIgnoreCase("Seleccione parentesco")) {
                            out.println(msg.ErrorParenteso2);
                        } else {//////Llamamiento para insetart con segundo acudiente
                            String Telefono2 = request.getParameter("Telefono2");
                            String Direccion2 = request.getParameter("Direccion2");
                            String idacu12 = request.getParameter("idacu12");
                            String NAcudiente2 = request.getParameter("NAcudiente2");
                            String aAcudiente2 = request.getParameter("aAcudiente2");
                            String celular2 = request.getParameter("celular2");
                            
                            if (!Telefono2.isEmpty() && !Direccion2.isEmpty() && !idacu12.isEmpty() && !NAcudiente2.isEmpty() 
                                    && !aAcudiente2.isEmpty()) {//Si todos estan diferentes de null se puede insertar

                                Conectar con = new Conectar();
                                int matricula = con.matricular(Ides, Nes, Aes, Fechan);
                                int persona = con.persona(idacu1, NAcudiente, AAcudiente, Telefono, celular);
                                int tutor = con.tutor(Seleccione_parentesco, idacu1, Direccion);
                                int estudiante_tutor = con.estudianteTutor(Ides, idacu1);
               
                                
                                int persona2 = con.persona(idacu12, NAcudiente2, aAcudiente2, Telefono2, celular2);
                                int tutor2 = con.tutor(Seleccione_parentesco2, idacu12, Direccion2);
                                int estudiante_tutor2 = con.estudianteTutor(Ides, idacu12);
                                int matricularcurso = con.matricularCurso(Fechan,Sdeporte,Ides);
                                
                                if (matricula != 0 && persona != 0 && tutor != 0 
                                        && estudiante_tutor != 0 && tutor2 != 0 && estudiante_tutor2 != 0) {
                                   out.println(msg.Correcto);
                                } else {
                                   out.println(msg.ErrorInsertar);
                                }

                            } else {
                                out.println(msg.FaltanDatos);
                            }

                        }
                    } else {// No se escojio la opcion De segundo acudiente
                        Conectar con = new Conectar();
                        
                        con.Estudiante_prematriculado(Ides);
                        
                        int matricula = con.matricular(Ides, Nes, Aes, Fechan);
                        int persona = con.persona(idacu1, NAcudiente, AAcudiente, Telefono, celular);
                        int tutor = con.tutor(Seleccione_parentesco, idacu1, Direccion);
                        int estudiante_tutor = con.estudianteTutor(Ides, idacu1);
                        int matricularcurso = con.matricularCurso(Fechan,Sdeporte,Ides);

                        if (matricula != 0 && persona != 0 && tutor != 0 && estudiante_tutor != 0) {
                            out.println(msg.Correcto);
                        } else {
                            out.println(msg.ErrorInsertar);
                        }
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
