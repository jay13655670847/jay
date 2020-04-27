package com.service;

import com.entity.Course;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/12.
 */
public interface CourseService {

    public List<Course> getAll(String hql, int page, int pageSize);

    public int getCount(String hql);

    public Serializable addCourse(Course course);

    public Course getCourseById(Integer id);

    public void updateCourse(Course course);

    public void delById(Integer id);
    
    public List<Course> getByHql(String hql);
}
