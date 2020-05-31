package co.com.poli.facturacion.repositorios;

import org.springframework.data.repository.CrudRepository;

import co.com.poli.facturacion.entidades.Vendedor;

public interface IVendedorRepository extends CrudRepository<Vendedor, String> {

}
