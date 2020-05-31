package co.com.poli.facturacion.entidades;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * Clase que representa la entidad servicio
 * 
 * @author Katerine
 *
 */

@Entity 
@Table(name = "servicio")
public class Servicio implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 9179282012966165581L;
	
	@Id
	@Column(name = "codigo_servicio")
	private String codigoServicio;
	
	@Column
	private String nombre;
	
	@Column
	private float precio;

	public Servicio() {
		super();
		
	}

	public Servicio(String codigoServicio, String nombre, float precio) {
		super();
		this.codigoServicio = codigoServicio;
		this.nombre = nombre;
		this.precio = precio;
	}

	public String getCodigoServicio() {
		return codigoServicio;
	}

	public void setCodigoServicio(String codigoServicio) {
		this.codigoServicio = codigoServicio;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public float getPrecio() {
		return precio;
	}

	public void setPrecio(float precio) {
		this.precio = precio;
	}

	

}
