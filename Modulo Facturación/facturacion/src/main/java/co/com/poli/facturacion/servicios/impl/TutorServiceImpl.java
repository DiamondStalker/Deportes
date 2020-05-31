package co.com.poli.facturacion.servicios.impl;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.com.poli.facturacion.entidades.Tutor;
import co.com.poli.facturacion.repositorios.ITutorRepository;
import co.com.poli.facturacion.servicios.ITutorService;

@Service
public class TutorServiceImpl implements ITutorService {

	@Autowired
	private ITutorRepository tutorRepository;
	
	@Override
	public Tutor guardar(Tutor tutor) {
		
		return tutorRepository.save(tutor);
	}

	@Override
	public List<Tutor> listarTutores() {
		
		Iterable <Tutor> iterable = tutorRepository.findAll();
		
		List<Tutor> actualList = StreamSupport
				  .stream(iterable.spliterator(), false)
				  .collect(Collectors.toList());
		
		
		return actualList;
	}

}
