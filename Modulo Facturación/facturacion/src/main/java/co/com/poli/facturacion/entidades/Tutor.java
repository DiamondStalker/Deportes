package co.com.poli.facturacion.entidades;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * Clase que representa la entidad tutor
 * 
 * @author Katerine
 *
 */

@Entity 
@Table(name = "tutor")
public class Tutor implements Serializable  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1125580394604790844L;
	
	@Id
	@Column(name = "id_tutor")
	private String idTutor;
	
	@Column
	private String nombre;
	
	@Column
	private String apellido;
	
	@Column
	private String telefono;
	
	@Column
	private String celular;
	
	@Column
	private String parentesco;
	
	@Column
	private String direccion;

	
	@Column(name = "tipo_de_tutor")
	private String tipoDeTutor;


	public Tutor() {
		super();
		
	}


	public Tutor(String idTutor, String nombre, String apellido, String telefono, String celular, String parentesco,
			String direccion, String tipoDeTutor) {
		super();
		this.idTutor = idTutor;
		this.nombre = nombre;
		this.apellido = apellido;
		this.telefono = telefono;
		this.celular = celular;
		this.parentesco = parentesco;
		this.direccion = direccion;
		this.tipoDeTutor = tipoDeTutor;
	}


	public String getIdTutor() {
		return idTutor;
	}


	public void setIdTutor(String idTutor) {
		this.idTutor = idTutor;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getApellido() {
		return apellido;
	}


	public void setApellido(String apellido) {
		this.apellido = apellido;
	}


	public String getTelefono() {
		return telefono;
	}


	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}


	public String getCelular() {
		return celular;
	}


	public void setCelular(String celular) {
		this.celular = celular;
	}


	public String getParentesco() {
		return parentesco;
	}


	public void setParentesco(String parentesco) {
		this.parentesco = parentesco;
	}


	public String getDireccion() {
		return direccion;
	}


	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}


	public String getTipoDeTutor() {
		return tipoDeTutor;
	}


	public void setTipoDeTutor(String tipoDeTutor) {
		this.tipoDeTutor = tipoDeTutor;
	}
	
		
	

	
	
}
