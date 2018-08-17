/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author rlimone
 */
@Entity
@Table(name = "subscripciones")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Subscripcion.findAll", query = "SELECT s FROM Subscripcion s")})
public class Subscripcion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id_subscripciones")
    protected Long idSubscripcion;
    @JoinColumn(name = "id_paginas", referencedColumnName = "id_paginas", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JsonBackReference(value = "pagina")
    private Pagina pagina;
    @JoinColumn(name = "id_usuarios", referencedColumnName = "id_usuarios", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JsonBackReference(value = "subscripciones")
    private Usuario usuario;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_tags", referencedColumnName = "id_tags")
    @JsonBackReference(value = "tags")
    private Tag idTags;
    @JsonBackReference
    @OneToOne(mappedBy = "subscripcion")
    private MetodoEnvio metodoEnvio;

    public Subscripcion() {
    }

    /*public Subscripcion(SubscripcionPK subscripcionPK) {
        this.subscripcionPK = subscripcionPK;
    }

    public Subscripcion(int idSubscripciones, int idUsuarios, int idPaginas) {
        this.subscripcionPK = new SubscripcionPK(idSubscripciones, idUsuarios, idPaginas);
    }

    public SubscripcionPK getSubscripcionPK() {
        return subscripcionPK;
    }

    public void setSubscripcionPK(SubscripcionPK subscripcionPK) {
        this.subscripcionPK = subscripcionPK;
    }*/

    public Pagina getPagina() {
        return pagina;
    }

    public void setPagina(Pagina pagina) {
        this.pagina = pagina;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Tag getIdTags() {
        return idTags;
    }

    public void setIdTags(Tag idTags) {
        this.idTags = idTags;
    }

    public MetodoEnvio getMetodoEnvio() {
        return metodoEnvio;
    }

    public void setMetodoEnvio(MetodoEnvio metodoEnvio) {
        this.metodoEnvio = metodoEnvio;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSubscripcion != null ? idSubscripcion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Subscripcion)) {
            return false;
        }
        Subscripcion other = (Subscripcion) object;
        if (this.idSubscripcion == null || other.idSubscripcion == null) {
            return false;
        }

        return this.idSubscripcion.equals(other.idSubscripcion);
    }

    @Override
    public String toString() {
        return "mariadb.Subscripcion[ idSubscripcion=" + idSubscripcion + " ]";
    }

}
