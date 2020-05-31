package co.com.poli.facturacion.servicios;

import java.util.List;

import co.com.poli.facturacion.entidades.Servicio;

public interface IServicioService {
	
	 Servicio guardar(Servicio servicio);
	 List<Servicio> listarServicios();

}
