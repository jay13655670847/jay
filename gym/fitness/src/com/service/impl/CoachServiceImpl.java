package com.service.impl;

import com.dao.GenericDao;
import com.entity.Coach;
import com.service.CoachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/11.
 */
@Service
public class CoachServiceImpl implements CoachService {

    @Autowired
    private GenericDao<Coach> coachDao;

  
    public List<Coach> getAll(String hql, int page, int pageSize) {
        return coachDao.getByPage(hql,page,pageSize);
    }

    
    public int getCount(String hql) {
        return coachDao.getCount(hql);
    }

   
    public Serializable addCoach(Coach coach) {
        return coachDao.add(coach);
    }

   
    public Coach getCoachById(Integer id) {
        return coachDao.get(Coach.class,id);
    }

   
    public void updateCoach(Coach coach) {
        coachDao.update(coach);
    }

    public void delById(Integer id) {
        coachDao.delete(getCoachById(id));
    }

}
