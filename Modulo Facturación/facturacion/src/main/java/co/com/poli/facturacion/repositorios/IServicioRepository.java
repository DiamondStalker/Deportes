package co.com.poli.facturacion.repositorios;

import org.springframework.data.repository.CrudRepository;

import co.com.poli.facturacion.entidades.Servicio;

public interface IServicioRepository extends CrudRepository<Servicio, String> {

}
