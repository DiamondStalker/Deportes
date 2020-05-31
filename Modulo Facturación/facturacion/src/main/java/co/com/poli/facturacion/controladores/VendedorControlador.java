package co.com.poli.facturacion.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import co.com.poli.facturacion.entidades.Vendedor;
import co.com.poli.facturacion.servicios.IVendedorService;

@RestController
@RequestMapping("/vendedor")
public class VendedorControlador {
	
	
	@Autowired
	private IVendedorService vendedorService;
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@GetMapping
	 public ResponseEntity<Vendedor> obtenerVendedor(){
		
		String nit = "890980136-6";
		Vendedor vendedor =  vendedorService.obtenerVendedor(nit);
		return new ResponseEntity(vendedor, HttpStatus.OK);
		
		
	}

}
