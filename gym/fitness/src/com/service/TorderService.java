package com.service;

import com.entity.Torder;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/12.
 */
public interface TorderService {

    public List<Torder> getAll(String hql, int page, int pageSize);

    public int getCount(String hql);

    public Serializable addTorder(Torder torder);

    public Torder getTorderById(Integer id);

    public void updateTorder(Torder torder);
    
    public List<Torder> getByHql(String hql, Object... args);

}
