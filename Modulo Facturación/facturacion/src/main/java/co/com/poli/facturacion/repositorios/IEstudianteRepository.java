package co.com.poli.facturacion.repositorios;

import org.springframework.data.repository.CrudRepository;

import co.com.poli.facturacion.entidades.Estudiante;

public interface IEstudianteRepository extends CrudRepository<Estudiante, String>{ 
	

}
