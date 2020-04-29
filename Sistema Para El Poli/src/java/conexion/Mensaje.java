package conexion;


import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;
public class Mensaje {
    
    public void mandarVerificacion(String cod,String correo){
        Properties propiedad = new Properties();
        propiedad.setProperty("mail.smtp.host", "smtp.gmail.com");
        propiedad.setProperty("mail.smtp.starttls.enable", "true");
        propiedad.setProperty("mail.smtp.port", "587");
        propiedad.setProperty("mail.smtp.auth", "tru");
        

        
        Session sesion = Session.getDefaultInstance(propiedad);
        String correoEnvia = "workcaresa@gmail.com";
        String contrasena = "proyectodeportes";
        String receptor = correo;
        String asunto = "Clave";
        String mensaje="Felicidades!!!\nAhora eres un docente\nEsta es tu clave temporal para entrar al portal deportivo\n"+cod+"\nCuando entres por primera vez se te mostrara"
                + "una una alerta para que cambies la contraseña ";
        
        MimeMessage mail = new MimeMessage(sesion);
        try {
            mail.setFrom(new InternetAddress (correoEnvia));
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress (receptor));
            mail.setSubject(asunto);
            mail.setText(mensaje);
            
            Transport transportar = sesion.getTransport("smtp");
            transportar.connect(correoEnvia,contrasena);
            transportar.sendMessage(mail, mail.getRecipients(Message.RecipientType.TO));          
            transportar.close();
            
            JOptionPane.showMessageDialog(null, "Listo, revise su correo");
            
            
        } catch (AddressException ex) {
            JOptionPane.showMessageDialog(null, ex);
        } catch (MessagingException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
          
    }

 
}
