package com.service;

import com.entity.Muscle;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/13.
 */
public interface MuscleService {

    public List<Muscle> getAll(String hql, int page, int pageSize);

    public int getCount(String hql);

    public Serializable addMuscle(Muscle muscle);

    public Muscle getMuscleById(Integer id);

    public void updateMuscle(Muscle muscle);

    public void delById(Integer id);
}
