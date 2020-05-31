package co.com.poli.facturacion.servicios.impl;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.com.poli.facturacion.entidades.Servicio;
import co.com.poli.facturacion.repositorios.IServicioRepository;
import co.com.poli.facturacion.servicios.IServicioService;

@Service
public class ServicioServiceImpl implements IServicioService{

	@Autowired
	private IServicioRepository servicioRepository;
	
	@Override
	public Servicio guardar(Servicio servicio) {
		
		return servicioRepository.save(servicio);
	}

	@Override
	public List<Servicio> listarServicios() {
		
Iterable<Servicio> iterable = servicioRepository.findAll();
		
		List<Servicio> actualList = StreamSupport
				  .stream(iterable.spliterator(), false)
				  .collect(Collectors.toList());
		return actualList;
	}

}
