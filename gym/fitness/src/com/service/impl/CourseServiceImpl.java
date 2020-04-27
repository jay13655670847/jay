package com.service.impl;

import com.dao.GenericDao;
import com.entity.Course;
import com.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/12.
 */
@Service
public class CourseServiceImpl implements CourseService{

    @Autowired
    private GenericDao<Course> courseDao;


    public List<Course> getAll(String hql, int page, int pageSize) {
        return courseDao.getByPage(hql,page,pageSize);
    }

   
    public int getCount(String hql) {
        return courseDao.getCount(hql);
    }

   
    public Serializable addCourse(Course course) {
        return courseDao.add(course);
    }

   
    public Course getCourseById(Integer id) {
        return courseDao.get(Course.class,id);
    }

    
    public void updateCourse(Course course) {
        courseDao.update(course);
    }

  
    public void delById(Integer id) {
        courseDao.delete(getCourseById(id));
    }
    
    public List<Course> getByHql(String hql) {
        return courseDao.getByHql(hql);
    }
}
