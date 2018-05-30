/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author rlimone
 */
@Entity
@Table(name = "categorias")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Categoria.findAll", query = "SELECT c FROM Categoria c")})
public class Categoria implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_categorias")
    private Integer idCategorias;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "glosa_categoria")
    private String glosaCategoria;
    @Size(min = 1, max = 255)
    @Column(name = "alias_categoria")
    private String aliasCategoria;
    @Size(min = 1, max = 255)
    @Column(name = "resenia")
    private String resenia;

    @OneToMany(mappedBy = "idCategorias", fetch = FetchType.LAZY)
    @JsonManagedReference(value = "paginas")
    private Set<Pagina> paginaSet;

    public Categoria() {
    }

    public Categoria(Integer idCategorias) {
        this.idCategorias = idCategorias;
    }

    public Categoria(Integer idCategorias, String glosaCategoria) {
        this.idCategorias = idCategorias;
        this.glosaCategoria = glosaCategoria;
    }

    public Integer getIdCategorias() {
        return idCategorias;
    }

    public void setIdCategorias(Integer idCategorias) {
        this.idCategorias = idCategorias;
    }

    public String getGlosaCategoria() {
        return glosaCategoria;
    }

    public void setGlosaCategoria(String glosaCategoria) {
        this.glosaCategoria = glosaCategoria;
    }

    public String getAliasCategoria() {
        return aliasCategoria;
    }

    public void setAliasCategoria(String aliasCategoria) {
        this.aliasCategoria = aliasCategoria;
    }

    public String getResenia() {
        return resenia;
    }

    public void setResenia(String resenia) {
        this.resenia = resenia;
    }

    @XmlTransient
    public Set<Pagina> getPaginaSet() {
        return paginaSet;
    }

    public void setPaginaSet(Set<Pagina> paginaSet) {
        this.paginaSet = paginaSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCategorias != null ? idCategorias.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Categoria)) {
            return false;
        }
        Categoria other = (Categoria) object;
        if (this.idCategorias == null || other.idCategorias == null) {
            return false;
        }

        return this.idCategorias.equals(other.idCategorias);
    }

    @Override
    public String toString() {
        return "mariadb.Categoria[ idCategorias=" + idCategorias + " ]";
    }

}
