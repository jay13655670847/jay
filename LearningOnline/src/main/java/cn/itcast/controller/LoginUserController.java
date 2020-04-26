package cn.itcast.controller;

import cn.itcast.domain.Message;
import cn.itcast.domain.User;
import cn.itcast.service.impl.LoginUserServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/loginUserController")
public class LoginUserController {

    @Autowired
    private LoginUserServiceImpl service;

    @RequestMapping("/login")
    public void login(User loginUser, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");

        //检验验证码
        String checkcode = request.getParameter("checkcode");
        HttpSession session = request.getSession();
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");//为了保证验证码只能使用一次

        Message message = new Message();

        if(checkcode==null || !checkcode.equalsIgnoreCase(checkcode_server)){
            System.out.println("验证码为空");
            //验证码为空
            message.setFlag(false);
            message.setMsg("验证码错误");

            ObjectMapper mapper = new ObjectMapper();
            String json =mapper.writeValueAsString(message);

            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(json);
            return ;
        }

        message = service.isLogin(loginUser);

        //存储用户，判断用户是否登录
        request.getSession().setAttribute("user",message.getUser());

        response.setContentType("application/json;charset=utf-8");
        ObjectMapper mapper=new ObjectMapper();
        mapper.writeValue(response.getWriter(),message);
    }

    @RequestMapping("/isLogin")
    public void isLogin(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("test/html'charset=utf-8");

        User user = (User) request.getSession().getAttribute("user");
        Message message=new Message();
        message.setUser(user);
        if(user!=null && !user.equals("")){
            message.setFlag(true);
        }else {
            message.setFlag(false);
        }

        response.setContentType("application/json;charset=utf-8");
        ObjectMapper mapper=new ObjectMapper();
        mapper.writeValue(response.getWriter(),message);
    }
}
