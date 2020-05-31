package co.com.poli.facturacion.entidades;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 
 * Clase que representa la entidad prefactura
 * 
 * @author Katerine
 *
 */


@Entity 
@Table(name = "prefactura")
public class Prefactura implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9191976834071325944L;
	
	
	@Id
	@Column(name = "num_prefactura")
	private String numPrefactura;
	
	@Column(name = "fecha_inicio")
	private Date fechaInicio;
	
	@Column(name = "fecha_fin")
	private Date fechaFin;
	
	@Column
	private String estado;
	
	@Column
	private float descuento;
	
	@Column
	private float iva;
	
	@Column
	private float total;
	
	@JoinColumn(name = "vendedor_nit", nullable = false)
    @ManyToOne(optional = false, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Vendedor vendedor;
	
	@JoinColumn(name = "estudiante_id_estudiante", nullable = false)
    @ManyToOne(optional = false, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Estudiante estudiante;
	
	@Column(name = "posicion_prefactura")
	private int posicionPrefactura;

	public Prefactura() {
		super();
	}

	public Prefactura(String numPrefactura, Date fechaInicio, Date fechaFin, String estado, float descuento, float iva,
			float total, Vendedor vendedor, Estudiante estudiante, int posicionPrefactura) {
		super();
		this.numPrefactura = numPrefactura;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.estado = estado;
		this.descuento = descuento;
		this.iva = iva;
		this.total = total;
		this.vendedor = vendedor;
		this.estudiante = estudiante;
		this.posicionPrefactura = posicionPrefactura;
	}

	public String getNumPrefactura() {
		return numPrefactura;
	}

	public void setNumPrefactura(String numPrefactura) {
		this.numPrefactura = numPrefactura;
	}

	public Date getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public float getDescuento() {
		return descuento;
	}

	public void setDescuento(float descuento) {
		this.descuento = descuento;
	}

	public float getIva() {
		return iva;
	}

	public void setIva(float iva) {
		this.iva = iva;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public Vendedor getVendedor() {
		return vendedor;
	}

	public void setVendedor(Vendedor vendedor) {
		this.vendedor = vendedor;
	}

	public Estudiante getEstudiante() {
		return estudiante;
	}

	public void setEstudiante(Estudiante estudiante) {
		this.estudiante = estudiante;
	}

	public int getPosicionPrefactura() {
		return posicionPrefactura;
	}

	public void setPosicionPrefactura(int posicionPrefactura) {
		this.posicionPrefactura = posicionPrefactura;
	}
	
	
	
	
}
