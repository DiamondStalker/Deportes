package co.com.poli.facturacion.repositorios;

import org.springframework.data.repository.CrudRepository;

import co.com.poli.facturacion.entidades.Factura;

public interface IFacturaRepository extends CrudRepository<Factura, String>{

}
