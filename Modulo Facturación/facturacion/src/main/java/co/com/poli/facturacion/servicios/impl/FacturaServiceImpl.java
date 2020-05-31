package co.com.poli.facturacion.servicios.impl;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.com.poli.facturacion.entidades.Factura;
import co.com.poli.facturacion.repositorios.IFacturaRepository;
import co.com.poli.facturacion.servicios.IFacturaService;

@Service
public class FacturaServiceImpl implements IFacturaService{

	
	@Autowired
	private IFacturaRepository facturaRepository;

	@Override
	public Factura guardar(Factura factura) {
		return facturaRepository.save(factura);
	}

	@Override
	public List<Factura> listarFacturas() {
		Iterable<Factura> iterable = facturaRepository.findAll();
		
		List<Factura> actualList = StreamSupport
				  .stream(iterable.spliterator(), false)
				  .collect(Collectors.toList());
		
		return actualList;
	}
}
