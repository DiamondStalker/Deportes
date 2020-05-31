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

import co.com.poli.facturacion.entidades.Factura;
import co.com.poli.facturacion.servicios.IFacturaService;

@RestController
@RequestMapping("/factura")
public class FacturaControlador {
	

	 @Autowired
	 private IFacturaService facturaService;
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
	 @GetMapping
	 public ResponseEntity<Factura> listarFacturas(){
		 
		List<Factura> lista = facturaService.listarFacturas();
		 return new ResponseEntity(lista, HttpStatus.OK);
	 };
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
	 @PostMapping("")
	 public ResponseEntity<?> saveFactura( @RequestBody Factura factura) {

		 Factura facturaNueva = facturaService.guardar(factura);
	     return new ResponseEntity(facturaNueva, HttpStatus.CREATED);
	    }
}
