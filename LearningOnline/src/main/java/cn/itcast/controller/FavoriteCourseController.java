package cn.itcast.controller;

import cn.itcast.domain.FavoriteCourse;
import cn.itcast.domain.Message;
import cn.itcast.domain.User;
import cn.itcast.service.impl.FavoriteCourseServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/favoriteCourseController")
public class FavoriteCourseController {

    @Autowired
    private FavoriteCourseServiceImpl service;

    /**
     * 收藏课程
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/favoriteCourse")
    public void FavoriteCourse(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");

        User user = (User) request.getSession().getAttribute("user");
        Message message=new Message();
        if(user!=null && !user.equals("")){
            //用户已登录
            int cid = Integer.parseInt(request.getParameter("id"));

            message = service.favoriteCourse(cid, user.getId());

            ObjectMapper mapper=new ObjectMapper();
            response.setContentType("application/json;charset=utf-8");
            mapper.writeValue(response.getWriter(),message);

        }else {
            //用户未登录
            message.setFlag(false);
            message.setMsg("您还未登录，请先登录！");

            ObjectMapper mapper=new ObjectMapper();
            response.setContentType("application/json;charset=utf-8");
            mapper.writeValue(response.getWriter(),message);
        }
    }


    @RequestMapping("/findAllCourse")
    public void findAllCourse(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");

        User user = (User) request.getSession().getAttribute("user");

        List<FavoriteCourse> allCourse = service.findAllCourse(user.getId());
        System.out.println(allCourse);

        ObjectMapper mapper=new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getWriter(),allCourse);
    }

    @RequestMapping("/checkFavorite")
    public void checkFavorite(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");

        User user = (User) request.getSession().getAttribute("user");
        int cid = Integer.parseInt(request.getParameter("id"));
        Message message=new Message();

        message = service.checkFavorite(cid, user.getId());

        ObjectMapper mapper=new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getWriter(),message);
    }
}
