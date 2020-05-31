package co.com.poli.facturacion.servicios.impl;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.com.poli.facturacion.entidades.Prefactura;
import co.com.poli.facturacion.repositorios.IPrefacturaRepository;
import co.com.poli.facturacion.servicios.IPrefacturaService;



@Service
public class PrefacturaServiceImpl implements IPrefacturaService {

	@Autowired
	private IPrefacturaRepository prefacturaRepository;
	
	@Override
	public Prefactura guardar(Prefactura prefactura) {
		
		return prefacturaRepository.save(prefactura);
	}
		@Override
		public List<Prefactura> listarPrefacturas() {
			
			Iterable<Prefactura> iterable = prefacturaRepository.findAll();
			
			List<Prefactura> actualList = StreamSupport
					  .stream(iterable.spliterator(), false)
					  .collect(Collectors.toList());
			
			return actualList;
	}
}
