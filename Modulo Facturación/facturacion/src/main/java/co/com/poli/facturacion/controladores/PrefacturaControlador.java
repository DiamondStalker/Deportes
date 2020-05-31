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

import co.com.poli.facturacion.entidades.Prefactura;
import co.com.poli.facturacion.servicios.IPrefacturaService;

@RestController
@RequestMapping("/prefactura")
public class PrefacturaControlador {
	
	 @Autowired
	 private IPrefacturaService prefacturaService;
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
	 @GetMapping
	 public ResponseEntity<Prefactura> listarPrefacturas(){
	 
		 List<Prefactura> lista = prefacturaService.listarPrefacturas();
		 return new ResponseEntity(lista, HttpStatus.OK);
 };
		 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
	 @PostMapping("")
 	 public ResponseEntity<?> savePrefactura( @RequestBody Prefactura prefactura) {

        Prefactura prefacturaNueva = prefacturaService.guardar(prefactura);
        return new ResponseEntity(prefacturaNueva, HttpStatus.CREATED);
    }
}
