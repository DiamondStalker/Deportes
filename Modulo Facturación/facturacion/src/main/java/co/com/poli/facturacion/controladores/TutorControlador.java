package co.com.poli.facturacion.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import co.com.poli.facturacion.entidades.Tutor;
import co.com.poli.facturacion.servicios.ITutorService;

@RestController
@RequestMapping("/tutor")
public class TutorControlador {
	
	@Autowired
	private ITutorService tutorService;
	
	 @SuppressWarnings({ "rawtypes", "unchecked" })
	 @GetMapping
	 public ResponseEntity<Tutor> listarTutores(){
		 
			List<Tutor> lista = tutorService.listarTutores();
			 return new ResponseEntity(lista, HttpStatus.OK);
		 };
		 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
	 @PostMapping("")
 	 public ResponseEntity<?> saveTutor( @RequestBody Tutor tutor) {

		 Tutor tutorNuevo = tutorService.guardar(tutor);
		 return new ResponseEntity(tutorNuevo, HttpStatus.CREATED);
    }
}
