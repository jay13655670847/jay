package cn.itcast.service.impl;

import cn.itcast.dao.CourseDao;
import cn.itcast.domain.Course;
import cn.itcast.domain.PageCourse;
import cn.itcast.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseDao dao;

    /**
     * 查询每页要展示的课程
     * @param currentPage//当前页数
     * @param rows//每页多少行
     * @return
     */
    @Override
    public List<Course> findCourse(int currentPage,int rows,String search) {
        int start=(currentPage-1)*10;
        List<Course> list = dao.findCourse(start,rows,search);
        return list;
    }

    /**
     * 分页查询
     * @param currentPage
     * @param rows
     * @return
     */
    @Override
    public PageCourse findCourseByPage(int currentPage, int rows,String search) {
        if(search=="" ||search==null || search.equals("null")){
            search=null;
        }

        List<Course> list = this.findCourse(currentPage, rows,search);
        int counts = dao.selectCounts(search);
        int totalPage=(counts % rows==0 ? (counts/rows):(counts/rows)+1);

        if(currentPage<=0){
            currentPage=1;
        }
        if(currentPage>totalPage){
            currentPage=totalPage;
        }

        PageCourse pageCourse=new PageCourse();

        pageCourse.setCounts(counts);
        pageCourse.setCurrentPage(currentPage);
        pageCourse.setRows(rows);
        pageCourse.setTotalPage(totalPage);
        pageCourse.setList(list);

        return pageCourse;
    }

    /**
     * 保存视频点击量
     * @param id
     * @param counts
     */
    @Override
    public void saveCounts(int id, int counts) {
        dao.saveCounts(id, counts);
    }

    /**
     *
     * @return
     */
    @Override
    public List<Course> findCourseByOrder() {
        List<Course> list = dao.findCourseByOrder();
        return list;
    }
}
