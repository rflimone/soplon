/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author rlimone
 */
@Entity
@Table(name = "paginas")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pagina.findAll", query = "SELECT p FROM Pagina p")})
public class Pagina implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_paginas")
    private Integer idPaginas;
    @Size(max = 255)
    @Column(name = "url")
    private String url;
    @Size(max = 255)
    @Column(name = "url_ultimo", unique = true)
    private String urlUltimo;
    @Size(max = 255)
    @Column(name = "titulo_pagina")
    private String tituloPagina;
    @Size(max = 255)
    @Column(name = "glosa_pagina")
    private String glosaPagina;
    @Column(name = "date_last")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateLast;
    @Column(name = "date_new")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateNew;
    @Lob
    @Column(name = "imagen")
    private byte[] imagen;
    @OneToMany(mappedBy = "pagina", fetch = FetchType.LAZY)
    @JsonManagedReference(value = "tags")
    private Set<Tag> tagSet;
    @JoinColumn(name = "id_categorias", referencedColumnName = "id_categorias")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JsonBackReference(value = "paginas")
    private Categoria idCategorias;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "pagina", fetch = FetchType.LAZY)
    @JsonManagedReference(value = "pagina")
    private Set<Subscripcion> subscripcionSet;

    public Pagina() {
    }

    public Pagina(Integer idPaginas) {
        this.idPaginas = idPaginas;
    }

    public Integer getIdPaginas() {
        return idPaginas;
    }

    public void setIdPaginas(Integer idPaginas) {
        this.idPaginas = idPaginas;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUrlUltimo() {
        return urlUltimo;
    }

    public void setUrlUltimo(String urlUltimo) {
        this.urlUltimo = urlUltimo;
    }

    public String getTituloPagina() {
        return tituloPagina;
    }

    public void setTituloPagina(String tituloPagina) {
        this.tituloPagina = tituloPagina;
    }

    public String getGlosaPagina() {
        return glosaPagina;
    }

    public void setGlosaPagina(String glosaPagina) {
        this.glosaPagina = glosaPagina;
    }

    public Date getDateLast() {
        return dateLast;
    }

    public void setDateLast(Date dateLast) {
        this.dateLast = dateLast;
    }

    public Date getDateNew() {
        return dateNew;
    }

    public void setDateNew(Date dateNew) {
        this.dateNew = dateNew;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    @XmlTransient
    public Set<Tag> getTagSet() {
        return tagSet;
    }

    public void setTagSet(Set<Tag> tagSet) {
        this.tagSet = tagSet;
    }

    public Categoria getIdCategorias() {
        return idCategorias;
    }

    public void setIdCategorias(Categoria idCategorias) {
        this.idCategorias = idCategorias;
    }

    @XmlTransient
    public Set<Subscripcion> getSubscripcionSet() {
        return subscripcionSet;
    }

    public void setSubscripcionSet(Set<Subscripcion> subscripcionSet) {
        this.subscripcionSet = subscripcionSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPaginas != null ? idPaginas.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Pagina)) {
            return false;
        }
        Pagina other = (Pagina) object;

        if (this.idPaginas == null || other.idPaginas == null) {
            return false;
        } else if (this.idPaginas.equals(other.idPaginas)) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public String toString() {
        return "mariadb.Pagina[ idPaginas=" + idPaginas + " ]";
    }

}
