package com.service.impl;

import com.dao.GenericDao;
import com.entity.Torder;
import com.service.TorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/12.
 */
@Service
public class TorderServiceImpl implements TorderService {

    @Autowired
    private GenericDao<Torder> torderDao;

   
    public List<Torder> getAll(String hql, int page, int pageSize) {
        return torderDao.getByPage(hql,page,pageSize);
    }

    
    public int getCount(String hql) {
        return torderDao.getCount(hql);
    }

  
    public Serializable addTorder(Torder torder) {
        return torderDao.add(torder);
    }


    public Torder getTorderById(Integer id) {
        return torderDao.get(Torder.class,id);
    }

  
    public void updateTorder(Torder torder) {
        torderDao.update(torder);
    }
    
    public List<Torder> getByHql(String hql, Object... args) {
        return torderDao.getByHql(hql,args);
    }
 }
