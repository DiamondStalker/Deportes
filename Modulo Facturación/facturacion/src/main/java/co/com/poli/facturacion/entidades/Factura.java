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
 * Clase que representa la entidad factura
 * 
 * @author katerine
 *
 */


@Entity 
@Table(name = "factura")
public class Factura implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1018905987743324093L;

	
	@Id
	@Column(name = "num_factura")
	private String numFactura;
	
	@Column
	private Date fecha;
	
	@JoinColumn(name = "num_prefactura", nullable = false)
    @ManyToOne(optional = false, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Prefactura prefactura;
	
	@JoinColumn(name = "tutor_id_tutor", nullable = false)
    @ManyToOne(optional = false, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Tutor tutor;

	public Factura() {
		super();
	}

	public Factura(String numFactura, Date fecha, Prefactura prefactura, Tutor tutor) {
		super();
		this.numFactura = numFactura;
		this.fecha = fecha;
		this.prefactura = prefactura;
		this.tutor = tutor;
	}

	public String getNumFactura() {
		return numFactura;
	}

	public void setNumFactura(String numFactura) {
		this.numFactura = numFactura;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Prefactura getPrefactura() {
		return prefactura;
	}

	public void setPrefactura(Prefactura prefactura) {
		this.prefactura = prefactura;
	}

	public Tutor getTutor() {
		return tutor;
	}

	public void setTutor(Tutor tutor) {
		this.tutor = tutor;
	}
	
	
	
}
