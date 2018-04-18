/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author rlimone
 */
@Entity
@Table(name = "metodos_envio")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MetodoEnvio.findAll", query = "SELECT m FROM MetodoEnvio m")})
public class MetodoEnvio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_metodos_envio")
    private Integer idMetodosEnvio;
    @Size(max = 255)
    @Column(name = "glosa_metodo_envio")
    private String glosaMetodoEnvio;
    @JoinColumn(name = "id_usuarios", referencedColumnName = "id_usuarios")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JsonBackReference
    private Usuario idUsuarios;

    public MetodoEnvio() {
    }

    public MetodoEnvio(Integer idMetodosEnvio) {
        this.idMetodosEnvio = idMetodosEnvio;
    }

    public Integer getIdMetodosEnvio() {
        return idMetodosEnvio;
    }

    public void setIdMetodosEnvio(Integer idMetodosEnvio) {
        this.idMetodosEnvio = idMetodosEnvio;
    }

    public String getGlosaMetodoEnvio() {
        return glosaMetodoEnvio;
    }

    public void setGlosaMetodoEnvio(String glosaMetodoEnvio) {
        this.glosaMetodoEnvio = glosaMetodoEnvio;
    }

    public Usuario getIdUsuarios() {
        return idUsuarios;
    }

    public void setIdUsuarios(Usuario idUsuarios) {
        this.idUsuarios = idUsuarios;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idMetodosEnvio != null ? idMetodosEnvio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MetodoEnvio)) {
            return false;
        }
        MetodoEnvio other = (MetodoEnvio) object;
        if ((this.idMetodosEnvio == null && other.idMetodosEnvio != null) || (this.idMetodosEnvio != null && !this.idMetodosEnvio.equals(other.idMetodosEnvio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mariadb.MetodoEnvio[ idMetodosEnvio=" + idMetodosEnvio + " ]";
    }
    
}
