package com.utc.api07.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "DOSSIER")
public class Dossier implements Serializable{

	private static final long serialVersionUID = -529749045710454285L;

	@Id
    @GenericGenerator(name = "ID_DOSSIER", strategy = "INCREMENT")
	@Column(name = "ID_DOSSIER")
    private int idDossier;

    @Column(name = "ETAT_CIVIL")
    @Size(min = 2, max = 200)
    private String etatCivil;
    
    @Column(name = "COORDONNEES")
    @Size(min = 2, max = 200)
    private String coordonnees;   
    
    @Column(name = "ANTECEDENTS")
    @Size(min = 2, max = 200)
    private String antecedents;   

    @Column(name = "VACCINATIONS")
    @Size(min = 2, max = 200)
    private String vaccinations;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "fk_user")
    private User fkUser;
    
    @Transient
    @NotNull
    private int idUser;

	/**
	 * @return the idDossier
	 */
	public int getIdDossier() {
		return idDossier;
	}

	/**
	 * @param idDossier the idDossier to set
	 */
	public void setIdDossier(int idDossier) {
		this.idDossier = idDossier;
	}

	/**
	 * @return the etatCivil
	 */
	public String getEtatCivil() {
		return etatCivil;
	}

	/**
	 * @param etatCivil the etatCivil to set
	 */
	public void setEtatCivil(String etatCivil) {
		this.etatCivil = etatCivil;
	}

	/**
	 * @return the coordonnees
	 */
	public String getCoordonnees() {
		return coordonnees;
	}

	/**
	 * @param coordonnees the coordonnees to set
	 */
	public void setCoordonnees(String coordonnees) {
		this.coordonnees = coordonnees;
	}

	/**
	 * @return the antecedents
	 */
	public String getAntecedents() {
		return antecedents;
	}

	/**
	 * @param antecedents the antecedents to set
	 */
	public void setAntecedents(String antecedents) {
		this.antecedents = antecedents;
	}

	/**
	 * @return the vaccinations
	 */
	public String getVaccinations() {
		return vaccinations;
	}

	/**
	 * @param vaccinations the vaccinations to set
	 */
	public void setVaccinations(String vaccinations) {
		this.vaccinations = vaccinations;
	}

	/**
	 * @return the fkUser
	 */
	public User getFkUser() {
		return fkUser;
	}

	/**
	 * @param fkUser the fkUser to set
	 */
	public void setFkUser(User fkUser) {
		this.fkUser = fkUser;
	}

	/**
	 * @return the idUser
	 */
	public int getIdUser() {
		return idUser;
	}

	/**
	 * @param idUser the idUser to set
	 */
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}


}
