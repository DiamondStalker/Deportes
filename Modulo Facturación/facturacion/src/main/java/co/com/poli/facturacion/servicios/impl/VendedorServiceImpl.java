package co.com.poli.facturacion.servicios.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.com.poli.facturacion.entidades.Vendedor;
import co.com.poli.facturacion.repositorios.IVendedorRepository;
import co.com.poli.facturacion.servicios.IVendedorService;

@Service
public class VendedorServiceImpl implements IVendedorService{
	
	
	@Autowired
	private IVendedorRepository vendedorRepository;
	
	@Override
	public Vendedor obtenerVendedor(String nit) {
		
		return vendedorRepository.findById(nit).get();
	}

}
