package com.utc.api07.dao;

import java.util.List;

public interface GenericDao<T> {
    
    /**
     * Ajout d'un objet T
     * @param c
     */
    public void add(T c);

    /**
     * Mise � jour d'un objet T
     * @param c
     */
    public void update(T c);

    /**
     * Renvoi une liste d'objet T
     * @return List<T>
     */
    public List<T> list();

    /**
     * Renvoi un objet T en fonction de son id
     * @param id
     * @return T
     */
    public T getById(int id);
    
    /**
     * Renvoi un objet T en fonction d'un crit�re
     * @param criteria
     * @param value
     * @return T
     */
    public T getByCriteria(String criteria, Object value);

    /**
     * Supprime un objet en fonction de son id
     * @param id
     */
    public void remove(int id);

}
