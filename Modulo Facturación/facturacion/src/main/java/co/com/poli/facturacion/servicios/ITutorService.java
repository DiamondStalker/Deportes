package co.com.poli.facturacion.servicios;

import java.util.List;

import co.com.poli.facturacion.entidades.Tutor;

public interface ITutorService {

	Tutor guardar(Tutor tutor);
	List<Tutor> listarTutores();
}
