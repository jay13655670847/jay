package cn.itcast.controller;

import cn.itcast.domain.Course;
import cn.itcast.domain.PageCourse;
import cn.itcast.service.impl.CourseServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/courseController")
public class CourseController {

    @Autowired
    private CourseServiceImpl service;

    /**
     * 课程详情
     * @param request
     * @param response
     * @param search
     * @throws IOException
     */
    @RequestMapping("/findCourse")
    public void findCourse(HttpServletRequest request, HttpServletResponse response,String search) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        //当前第几页
        String currentPage_str = request.getParameter("currentPage");
        int currentPage=0;
        if(currentPage_str != null && currentPage_str.length() > 0){
            currentPage = Integer.parseInt(currentPage_str);
        }else{
            currentPage = 1;
        }
        int rows=10;

        PageCourse courseByPage = service.findCourseByPage(currentPage, rows,search);

        ObjectMapper mapper=new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getWriter(),courseByPage);
    }

    /**
     * 保存视频点击量
     * @param request
     * @param response
     */
    @RequestMapping("/saveCounts")
    public void saveCounts(HttpServletRequest request,HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");

        int id = Integer.parseInt(request.getParameter("id"));
        int counts = Integer.parseInt(request.getParameter("counts"));

        service.saveCounts(id,counts);
    }

    @RequestMapping("/findMaxCourse")
    public void findMaxCourse(HttpServletResponse response,HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");

        List<Course> list = service.findCourseByOrder();

        ObjectMapper mapper=new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getWriter(),list);
    }
}
