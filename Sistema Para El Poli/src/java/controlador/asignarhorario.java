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
@WebServlet(name = "asignarhorario", urlPatterns = {"/asignarhorario"})
public class asignarhorario extends HttpServlet {

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

            String deporte = request.getParameter("deportes");
            String categoria = request.getParameter("categoria");
            String horario = request.getParameter("horario");

            /*
             * Antes de realizar la respectiva asginacion de datos
             * tenemos que verificar que este no exista
             * en caso de que ya exista esta asignacion 
             * devolveremos un mensaje diciento :
             * Esta hora ya esta asignada al deporte y a la categoria
             * para poder hacer este procedimiento 
             * primero debemos conocer el codigo "pk" de cada dato
             * obtenido del formulario "administrador.jsp --> div Asignar-hora "
             */
            Conectar Con = new Conectar();
            String Codigo_deporte = Con.Codigo_deporte(deporte);
            String Codigo_horario = Con.Codigo_horario(horario);
            String Codigo_categoria = Con.Codigo_categoria(categoria);

            //Primero preguntamos si esa categoria tiene asignada un deporte
            if (Con.Deporte_categoria(Codigo_deporte, Codigo_categoria,Codigo_horario) == 0) {// En el caso de que este sea igual a 0 significa que no existe la categoria asignada a ese deporte
                
                
                Con.Insertar_deporte_categoria_horario(Codigo_deporte, Codigo_categoria,Codigo_horario);
                
                
                out.print(MensajesErrores.Asignacion_correcta);
                /*
                 * Procedemos a entrar a la carpeta del deporte y creamos dentro
                 * otra carpeta con la categoria
                 * y dentro de este creamos un txt con la hora de asignacion
                 */
                Textos Txt = new Textos();
                
                
                /*
                 * Antes de crear el archvo tenemos que preguntar al db si ya existe una relacion entre el deporte y la categoria
                 * en el caso de que no existe dicha relacion procederemos acreear el primer archivo
                 * en el caso de que ya existe dicha relacion procederon a concatener; lo que hace es leer el archivo previo para poder crear un nuevo archivo con la informacion anterior mas la nueva
                 */
                
                int Existe_archivo = Con.Existe_deporte_categoria(Codigo_deporte, Codigo_categoria);
                
                if(Existe_archivo == 1){//Caso de ser cero se crea el archivo 
                    Txt.Crear_carpeta_deporte_categoria(deporte, categoria, horario);
                }  
                else {//Caso != 0 se concatena el archivo
                    Txt.Concatener_informacion_horario(deporte, categoria, horario);
                } 
                
                Txt.Concatenar_categorias(deporte,categoria);
                
            } else {
                // Como ya existe una relacion mostramos alerta de que ya existe una relacion
                out.print(MensajesErrores.Asignacion_fallida);
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
