/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportes;

import conexion.Conectar;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import static javax.swing.WindowConstants.DISPOSE_ON_CLOSE;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author user
 */
public class reportes {
    
    public void Listar_estudiantes() {
       try {
            // TODO add your handling code here:
            
            
            Conectar con = new Conectar();
            
            Connection conn = con.getConexion();
            
            JasperReport reporte = null;
            String path = "C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\src\\java\\reportes\\Estudiantes.jasper";
            reporte = (JasperReport) JRLoader.loadObjectFromFile(path);
        
            JasperPrint jprint = JasperFillManager.fillReport(path,null, conn);
            
            
            
            JasperExportManager.exportReportToPdfFile(jprint,"C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\web\\ListaEstudiantes.pdf");
            
        
        } catch (JRException ex) {
            Logger.getLogger(reportes.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
    
    
}
