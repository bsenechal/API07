package com.utc.api07.service;

import java.util.List;

import com.utc.api07.dao.GenericDao;
import com.utc.api07.service.GenericService;

public class GenericServiceImpl<T> implements GenericService<T> {
	
    private GenericDao<T> dao;

    public GenericServiceImpl(Class<T> tClass) {
        super();
    }

    public GenericServiceImpl() {
        super();
    }

    public void setDao(GenericDao<T> dao) {
        this.dao = dao;
    }

    public GenericDao<T> getDao() {
        return dao;
    }

    @Override
    public void add(T u) {
        this.dao.add(u);
    }

    @Override
    public void update(T u) {
        this.dao.update(u);
    }

    @Override
    public List<T> list() {
        return this.dao.list();
    }

    @Override
    public T getById(int id) {
        return this.dao.getById(id);
    }

    @Override
    public void remove(int id) {
        this.dao.remove(id);
    }

    @Override
    public T getByCriteria(String criteria, Object value) {
        return this.dao.getByCriteria(criteria, value);
    }
}
