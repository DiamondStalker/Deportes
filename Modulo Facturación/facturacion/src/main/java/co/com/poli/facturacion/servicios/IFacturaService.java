package co.com.poli.facturacion.servicios;

import java.util.List;

import co.com.poli.facturacion.entidades.Factura;

public interface IFacturaService {
	
	 Factura guardar(Factura factura);
	 List<Factura> listarFacturas();

}
