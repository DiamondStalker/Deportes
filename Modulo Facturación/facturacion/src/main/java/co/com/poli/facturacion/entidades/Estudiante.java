package co.com.poli.facturacion.entidades;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * Clase que representa la entidad estudiante
 * 
 * @author katerine
 *
 */


@Entity 
@Table(name = "estudiante")
public class Estudiante implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2252407272665301069L;

	@Id
	@Column(name = "id_estudiante")
	private String idEstudiante;
	
	@Column
	private String nombre;
	
	@Column
	private String apellido;
	
	@Column(name = "fecha_nacimiento")
	private Date fechaNacimiento ;

	
	
	public Estudiante() {
		super();
	}
	
	

	public Estudiante(String idEstudiante, String nombre, String apellido, Date fechaNacimiento) {
		super();
		this.idEstudiante = idEstudiante;
		this.nombre = nombre;
		this.apellido = apellido;
		this.fechaNacimiento = fechaNacimiento;
	}



	public String getIdEstudiante() {
		return idEstudiante;
	}

	public void setIdEstudiante(String idEstudiante) {
		this.idEstudiante = idEstudiante;
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

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	
	
}
