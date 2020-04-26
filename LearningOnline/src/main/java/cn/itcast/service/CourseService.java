package cn.itcast.service;

import cn.itcast.domain.Course;
import cn.itcast.domain.PageCourse;

import java.util.List;

public interface CourseService {

    List<Course> findCourse(int currentPage,int rows,String search);

    PageCourse findCourseByPage(int currentPage, int rows,String search);

    void saveCounts(int id,int counts);

    List<Course> findCourseByOrder();
}
