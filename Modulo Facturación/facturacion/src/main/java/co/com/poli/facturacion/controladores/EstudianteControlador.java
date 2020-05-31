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

import co.com.poli.facturacion.entidades.Estudiante;
import co.com.poli.facturacion.servicios.IEstudianteService;

@RestController
@RequestMapping("/estudiante")
public class EstudianteControlador {

	
	 @Autowired
	 private IEstudianteService estudianteService;
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
	 @GetMapping
	 public ResponseEntity<Estudiante> listarEstudiantes(){
		 
		List<Estudiante> lista = estudianteService.listarEstudiantes();
		 return new ResponseEntity(lista, HttpStatus.OK);
	 };
	 
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
	 @PostMapping("")
 	 public ResponseEntity<?> saveEstudiante( @RequestBody Estudiante estudiante) {

        Estudiante estudianteNuevo = estudianteService.guardar(estudiante);
        return new ResponseEntity(estudianteNuevo, HttpStatus.CREATED);
    }
}
