package controlador;

import Metodos.Excell;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

@WebServlet("/UploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class UploadServlet extends HttpServlet {

    /**
     * Se captura los datos que esta en el formula con el archivo Luego cojemos
     * ese archivo y creamos en el servidor un archivo coipia
     */
    private static final String SAVE_DIR = "uploadFiles";

    /**
     * handles file upload
     *
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets absolute path of the web application
        String appPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String savePath = appPath + File.separator + SAVE_DIR;

        // creates the save directory if it does not exists
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        
        String FileN="";
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            // Renombra el fileName en caso de que sea una ruta absoluta
            fileName = new File(fileName).getName();
            part.write(savePath + File.separator + fileName);
            FileN=fileName;
        }
        
        Excell exc = new Excell();
        try {
            exc.Exportar(FileN);
        } catch (Exception ex) {
            Logger.getLogger(UploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("message", "Se han cargado todos los usuario!");
        getServletContext().getRequestDispatcher("/message.jsp").forward(
                request, response);
    }

    /**
     * Extrae el nombre del archivo de la disposición de contenido del
     * encabezado HTTP
     */
    
    private String extractFileName(Part part) {

        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                System.out.println(s.substring(s.indexOf("=") + 2, s.length() - 1));
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
