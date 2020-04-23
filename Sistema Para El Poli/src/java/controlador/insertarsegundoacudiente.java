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

/**
 *
 * @author user
 */
@WebServlet(name = "insertarsegundoacudiente", urlPatterns = {"/insertarsegundoacudiente"})
public class insertarsegundoacudiente extends HttpServlet {

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
            String Identificacion_estudiante = request.getParameter("identificacion_estudiante");
            String Identificacion_acudiente = request.getParameter("identificacion_acudiente");
            String Parentesco = request.getParameter("Seleccione_parentesco");

            Conectar Con = new Conectar();
            int i = Con.Ver_estudiante(Identificacion_estudiante);
            if (i == 0) {//Si es '0' es porque el estudiante no existe
                out.println(MensajesErrores.Estudiante_no_existe);
            } else {

                if (Parentesco.equalsIgnoreCase("Seleccione parentesco")) {//Pregunta del parentesco diferente a seleccionar "Opcion correcta"
                    out.println(MensajesErrores.ErrorParenteso);
                } else {
                    /*
                     *Antes de insertar al tutor preguntamos si este existe o no
                     */
                    int Tutor = 0;
                    int Persona = 0;
                    int Estudiante_tutor = 0;

                    int Existe_tutor = Con.Existe_tutor(Identificacion_acudiente);
                    if (Existe_tutor != 0) {//El tutor ya existe
                        Estudiante_tutor = Con.estudianteTutor(Identificacion_estudiante, Identificacion_acudiente);
                    } else {
                        String Nombre_acudiente = request.getParameter("NAcudiente");
                        String Apellido_acudiente = request.getParameter("Aacudiente");
                        String Telefono = request.getParameter("Telefono");
                        String Celular = request.getParameter("Celular");
                        String Direccion = request.getParameter("Direccion");

                        if (!Nombre_acudiente.isEmpty() && !Apellido_acudiente.isEmpty()
                                && !Telefono.isEmpty() && !Celular.isEmpty()
                                && !Direccion.isEmpty()) { // Preguntamos que si todos los datos estan llenos
                            
                            Persona = Con.persona(Identificacion_acudiente, Nombre_acudiente, Apellido_acudiente, Telefono, Celular);
                            Tutor = Con.tutor(Parentesco, Identificacion_acudiente, Direccion);
                            Estudiante_tutor = Con.estudianteTutor(Identificacion_estudiante, Identificacion_acudiente);
                            if (Persona != 0 && Tutor != 0 && Estudiante_tutor != 0) {
                                out.println(MensajesErrores.Correcto);
                                Textos txt = new Textos();
                                String appPath = request.getServletContext().getRealPath("");
                                Textos.Direccion_archivo = appPath;
                                String Nombre_estudiante = Con.Nombre_estudiante(Identificacion_estudiante);
                                txt.Concatenar_acudiente(Nombre_estudiante, Identificacion_acudiente, Nombre_acudiente, Apellido_acudiente, Parentesco, Telefono, Celular, Direccion);
                            } else {
                                out.println(MensajesErrores.ErrorInsertar);
                            }
                        }else out.println(MensajesErrores.FaltanDatos_por_llenar);

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
