package cn.itcast.controller;

import cn.itcast.domain.Message;
import cn.itcast.domain.User;
import cn.itcast.service.impl.RegisterUserServiceImpl;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.XmlWebApplicationContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/registerUser")
public class RegisterUserController {

    @Autowired
    private RegisterUserServiceImpl service;

    @RequestMapping("/register")
    public void register(HttpServletRequest request, HttpServletResponse response,User registerUser) throws IOException {
        response.setContentType("text/html;charset=utf-8");

        //检验验证码
        String checkcode = request.getParameter("checkcode");
        HttpSession session = request.getSession();
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");//为了保证验证码只能使用一次

        Message message=new Message();
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

        Message msg = service.findOne(registerUser);
        if(!msg.getFlag()){
            ObjectMapper mapper = new ObjectMapper();
            String json =mapper.writeValueAsString(msg);

            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(json);
            return ;
        }

        message= service.save(registerUser);

        response.setContentType("application/json;charset=utf-8");
        ObjectMapper mapper=new ObjectMapper();
        mapper.writeValue(response.getWriter(),message);

    }
}
