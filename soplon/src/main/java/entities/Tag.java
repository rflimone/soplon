/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import org.apache.commons.lang3.RandomUtils;

import javax.persistence.*;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import java.io.Serializable;
import java.util.List;
import java.util.Set;
import java.util.UUID;

/**
 * @author rlimone
 */
@Entity
@Table(name = "tags")
@XmlRootElement
@NamedQueries({
        @NamedQuery(name = "Tag.findAll", query = "SELECT t FROM Tag t"),
        @NamedQuery(name = "Tag.findByGlosa", query = "SELECT t FROM Tag t WHERE UPPER(t.glosaTag) = UPPER(:glosa) ")
})
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
    @ManyToMany(fetch = FetchType.LAZY)
    @JsonBackReference(value = "tags")
    private List<Pagina> paginas;
    @OneToMany(mappedBy = "idTags", fetch = FetchType.LAZY)
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

    public List<Pagina> getPaginas() {
        return paginas;
    }

    public void setPaginas(List<Pagina> paginas) {
        this.paginas = paginas;
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
        if (!(object instanceof Tag)) {
            return false;
        }
        Tag other = (Tag) object;
        if (this.idTags == null || other.idTags == null) {
            return false;
        }
        return this.idTags.equals(other.idTags);
    }

    @Override
    public String toString() {
        return "Tag{" +
                "idTags=" + idTags +
                ", glosaTag='" + glosaTag + '\'' +
                '}';
    }
}
