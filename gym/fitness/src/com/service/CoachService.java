package com.service;

import com.entity.Coach;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/11.
 */
public interface CoachService {

    public List<Coach> getAll(String hql, int page, int pageSize);

    public int getCount(String hql);

    public Serializable addCoach(Coach coach);

    public Coach getCoachById(Integer id);

    public void updateCoach(Coach coach);
    
    public void delById(Integer id);
}
