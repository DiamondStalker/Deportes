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

import co.com.poli.facturacion.entidades.Servicio;
import co.com.poli.facturacion.servicios.IServicioService;

@RestController
@RequestMapping("/servicio")
public class ServicioControlador {

	
	 @Autowired
	 private IServicioService servicioService;
	 
	 @SuppressWarnings({ "rawtypes", "unchecked" })
		@GetMapping
	 public ResponseEntity<Servicio> listarServicios(){
		 
		List<Servicio> lista = servicioService.listarServicios();
		return new ResponseEntity(lista, HttpStatus.OK);
	 };
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
	 @PostMapping("")
 	 public ResponseEntity<?> saveServicio( @RequestBody Servicio servicio) {

		 Servicio servicioNuevo = servicioService.guardar(servicio);
        return new ResponseEntity(servicioNuevo, HttpStatus.CREATED);
    }
}
