package co.com.poli.facturacion.servicios;

import java.util.List;

import co.com.poli.facturacion.entidades.Estudiante;

public interface IEstudianteService {

 Estudiante guardar(Estudiante estudiante);
 List<Estudiante> listarEstudiantes();
}
