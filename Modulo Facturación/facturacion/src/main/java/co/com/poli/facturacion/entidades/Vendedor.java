package co.com.poli.facturacion.entidades;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * Clase que representa la entidad vendedor
 * 
 * @author Katerine
 *
 */

@Entity 
@Table(name = "vendedor")
public class Vendedor implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8501866325206925828L;
	
	
	@Id
	@Column
	private String nit;
	
	@Column
	private String nombre;
	
	@Column
	private String telefono;
	
	@Column
	private String direccion;

	public Vendedor() {
		super();
		
	}

	public Vendedor(String nit, String nombre, String telefono, String direccion) {
		super();
		this.nit = nit;
		this.nombre = nombre;
		this.telefono = telefono;
		this.direccion = direccion;
	}

	public String getNit() {
		return nit;
	}

	public void setNit(String nit) {
		this.nit = nit;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	
	
	
}
