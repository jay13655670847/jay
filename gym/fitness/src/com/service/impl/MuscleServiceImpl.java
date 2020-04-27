package com.service.impl;

import com.dao.GenericDao;
import com.entity.Muscle;
import com.service.MuscleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/13.
 */
@Service
public class MuscleServiceImpl implements MuscleService{

    @Autowired
    private GenericDao<Muscle> muscleDao;

  
    public List<Muscle> getAll(String hql, int page, int pageSize) {
        return muscleDao.getByPage(hql,page,pageSize);
    }

  
    public int getCount(String hql) {
        return muscleDao.getCount(hql);
    }

   
    public Serializable addMuscle(Muscle muscle) {
        return muscleDao.add(muscle);
    }

  
    public Muscle getMuscleById(Integer id) {
        return muscleDao.get(Muscle.class,id);
    }

   
    public void updateMuscle(Muscle muscle) {
        muscleDao.update(muscle);
    }


    public void delById(Integer id) {
        muscleDao.delete(getMuscleById(id));
    }
}
