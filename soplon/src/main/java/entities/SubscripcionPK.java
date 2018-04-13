/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author rlimone
 */
@Embeddable
public class SubscripcionPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "id_subscripciones")
    private int idSubscripciones;
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_usuarios")
    private int idUsuarios;
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_paginas")
    private int idPaginas;

    public SubscripcionPK() {
    }

    public SubscripcionPK(int idSubscripciones, int idUsuarios, int idPaginas) {
        this.idSubscripciones = idSubscripciones;
        this.idUsuarios = idUsuarios;
        this.idPaginas = idPaginas;
    }

    public int getIdSubscripciones() {
        return idSubscripciones;
    }

    public void setIdSubscripciones(int idSubscripciones) {
        this.idSubscripciones = idSubscripciones;
    }

    public int getIdUsuarios() {
        return idUsuarios;
    }

    public void setIdUsuarios(int idUsuarios) {
        this.idUsuarios = idUsuarios;
    }

    public int getIdPaginas() {
        return idPaginas;
    }

    public void setIdPaginas(int idPaginas) {
        this.idPaginas = idPaginas;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idSubscripciones;
        hash += (int) idUsuarios;
        hash += (int) idPaginas;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SubscripcionPK)) {
            return false;
        }
        SubscripcionPK other = (SubscripcionPK) object;
        if (this.idSubscripciones != other.idSubscripciones) {
            return false;
        }
        if (this.idUsuarios != other.idUsuarios) {
            return false;
        }
        if (this.idPaginas != other.idPaginas) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mariadb.SubscripcionPK[ idSubscripciones=" + idSubscripciones + ", idUsuarios=" + idUsuarios + ", idPaginas=" + idPaginas + " ]";
    }
    
}
