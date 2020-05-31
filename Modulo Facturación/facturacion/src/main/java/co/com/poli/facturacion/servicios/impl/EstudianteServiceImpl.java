package co.com.poli.facturacion.servicios.impl;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.com.poli.facturacion.entidades.Estudiante;
import co.com.poli.facturacion.repositorios.IEstudianteRepository;
import co.com.poli.facturacion.servicios.IEstudianteService;

@Service
public class EstudianteServiceImpl implements IEstudianteService {

	@Autowired
	private IEstudianteRepository estudianteRepository;
	
	@Override
	public Estudiante guardar(Estudiante estudiante) {
		
		return estudianteRepository.save(estudiante);
	}

	@Override
	public List<Estudiante> listarEstudiantes() {
		
		Iterable<Estudiante> iterable = estudianteRepository.findAll();
		
		List<Estudiante> actualList = StreamSupport
				  .stream(iterable.spliterator(), false)
				  .collect(Collectors.toList());
		
		return actualList;
	}

}
