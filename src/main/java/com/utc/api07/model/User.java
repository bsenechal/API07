package com.utc.api07.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name = "USER")
public class User implements Serializable{

	private static final long serialVersionUID = -5327553925389840714L;

	@Id
    @GenericGenerator(name = "id_user", strategy = "INCREMENT")
	@Column(name = "id_user")
    private int idUser;

    @Column(name = "password")
    @Size(min = 6, max = 30)
    private String password;
    
    @Column(name = "login")
    @Size(min = 1, max = 40)
    private String login;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "fk_role")
    private Role role;

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

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the login
	 */
	public String getLogin() {
		return login;
	}

	/**
	 * @param login the login to set
	 */
	public void setLogin(String login) {
		this.login = login;
	}

	/**
	 * @return the role
	 */
	public Role getRole() {
		return role;
	}

	/**
	 * @param role the role to set
	 */
	public void setRole(Role role) {
		this.role = role;
	}	
}
