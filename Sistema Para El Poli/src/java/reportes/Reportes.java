/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportes;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import static javax.swing.WindowConstants.DISPOSE_ON_CLOSE;
import modelo.Conexion;
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
public class Reportes {
    
    public void Lista_estudiantes(){
        try {
            Conexion con = new Conexion();
            
            Connection conn = con.getConexion();
            
            JasperReport reporte = null;
            String path = "C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\src\\java\\reportes\\Listaestudiantes.jasper";
            reporte = (JasperReport) JRLoader.loadObjectFromFile(path);
        
            JasperPrint jprint = JasperFillManager.fillReport(path,null, conn);
            
            JasperViewer view = new JasperViewer(jprint,false);
            
            JasperExportManager.exportReportToPdfFile(jprint,"C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\web\\Registros\\Reportes\\ListaEstudiantes.pdf");
            
        } catch (JRException ex) {
            Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void Lista_docentes(String Deporte){
        try {
            Conexion con = new Conexion();
            
            Connection conn = con.getConexion();
            
            JasperReport reporte = null;
            String path = "C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\src\\java\\reportes\\ListaProfesores.jasper";
            
            Map parametro = new HashMap();
            
            parametro.put("Nombre_deporte",Deporte);
            reporte = (JasperReport) JRLoader.loadObjectFromFile(path);
        
            JasperPrint jprint = JasperFillManager.fillReport(path,parametro, conn);
            
            JasperExportManager.exportReportToPdfFile(jprint,"C:\\Users\\user\\Documents\\GitHub\\Deportes\\Sistema Para El Poli\\web\\Registros\\Reportes\\ListaDocentes"+Deporte+".pdf");
            
        } catch (JRException ex) {
            Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}