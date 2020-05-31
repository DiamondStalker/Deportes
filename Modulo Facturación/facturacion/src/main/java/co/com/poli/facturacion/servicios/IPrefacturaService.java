package co.com.poli.facturacion.servicios;

import java.util.List;

import co.com.poli.facturacion.entidades.Prefactura;

public interface IPrefacturaService {

	 Prefactura guardar(Prefactura prefactura);
	 List<Prefactura> listarPrefacturas();
}
