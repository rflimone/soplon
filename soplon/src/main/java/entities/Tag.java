/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.io.Serializable;
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
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author rlimone
 */
@Entity
@Table(name = "tags")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tag.findAll", query = "SELECT t FROM Tag t")})
public class Tag implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_tags")
    private Integer idTags;
    @Size(max = 255)
    @Column(name = "glosa_tag")
    private String glosaTag;
    @JoinTable(name = "tags_paginas", joinColumns = {
        @JoinColumn(name = "id_tags", referencedColumnName = "id_tags")}, inverseJoinColumns = {
        @JoinColumn(name = "id_paginas", referencedColumnName = "id_paginas")})
    @ManyToOne(fetch = FetchType.LAZY)
    @JsonBackReference(value = "tags")
    private Pagina pagina;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idTags", fetch = FetchType.LAZY)
    @JsonManagedReference(value = "tags")
    private Set<Subscripcion> subscripcionSet;

    public Tag() {
    }

    public Tag(Integer idTags) {
        this.idTags = idTags;
    }

    public Integer getIdTags() {
        return idTags;
    }

    public void setIdTags(Integer idTags) {
        this.idTags = idTags;
    }

    public String getGlosaTag() {
        return glosaTag;
    }

    public void setGlosaTag(String glosaTag) {
        this.glosaTag = glosaTag;
    }

    public Pagina getPagina() {
        return pagina;
    }

    public void setPagina(Pagina pagina) {
        this.pagina = pagina;
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
        hash += (idTags != null ? idTags.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tag)) {
            return false;
        }
        Tag other = (Tag) object;
        if ((this.idTags == null && other.idTags != null) || (this.idTags != null && !this.idTags.equals(other.idTags))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mariadb.Tag[ idTags=" + idTags + " ]";
    }

}
