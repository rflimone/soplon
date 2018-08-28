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
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author rlimone
 */
@Entity
@Table(name = "usuarios")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u"),
    @NamedQuery(name = "Usuario.findByUsername", query = "SELECT DISTINCT u FROM Usuario u LEFT JOIN FETCH u.subscripciones s LEFT JOIN FETCH s.metodoEnvio WHERE u.email = :email")})
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_usuarios")
    private Integer idUsuarios;
    @Size(max = 255)
    @Column(name = "nombres")
    private String nombres;
    @Size(max = 255)
    @Column(name = "apellido_paterno")
    private String apellidoPaterno;
    @Size(max = 255)
    @Column(name = "apellido_materno")
    private String apellidoMaterno;
    @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Column(name = "celular")
    private int celular;
    @Basic(optional = false)
    @NotNull
    @Column(name = "activo")
    private short activo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "password")
    private String password;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idUsuarios", fetch = FetchType.LAZY)
    @JsonManagedReference(value = "metodoEnvio")
    private Set<MetodoEnvio> metodosDeEnvio;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usuario", fetch = FetchType.LAZY)
    private Set<Subscripcion> subscripciones;

    public Usuario() {
    }

    public Usuario(Integer idUsuarios) {
        this.idUsuarios = idUsuarios;
    }

    public Usuario(Integer idUsuarios, String email, int celular, short activo) {
        this.idUsuarios = idUsuarios;
        this.email = email;
        this.celular = celular;
        this.activo = activo;
    }

    public Integer getIdUsuarios() {
        return idUsuarios;
    }

    public void setIdUsuarios(Integer idUsuarios) {
        this.idUsuarios = idUsuarios;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    public void setApellidoPaterno(String apellidoPaterno) {
        this.apellidoPaterno = apellidoPaterno;
    }

    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    public void setApellidoMaterno(String apellidoMaterno) {
        this.apellidoMaterno = apellidoMaterno;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getCelular() {
        return celular;
    }

    public void setCelular(int celular) {
        this.celular = celular;
    }

    public short getActivo() {
        return activo;
    }

    public void setActivo(short activo) {
        this.activo = activo;
    }

    @XmlTransient
    public Set<MetodoEnvio> getMetodosDeEnvio() {
        return metodosDeEnvio;
    }

    public void setMetodosDeEnvio(Set<MetodoEnvio> metodosDeEnvio) {
        this.metodosDeEnvio = metodosDeEnvio;
    }

    @XmlTransient
    public Set<Subscripcion> getSubscripciones() {
        return subscripciones;
    }

    public void setSubscripciones(Set<Subscripcion> subscripciones) {
        this.subscripciones = subscripciones;
    }
    
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idUsuarios != null ? idUsuarios.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if (this.idUsuarios == null || other.idUsuarios == null) {
            return false;
        }

        return this.idUsuarios.equals(other.idUsuarios);
    }

    @Override
    public String toString() {
        return "mariadb.Usuario[ idUsuarios=" + idUsuarios + " ]";
    }
    
}
