package cn.itcast.servlet;

import cn.itcast.domain.Message;
import cn.itcast.domain.User;
import cn.itcast.service.impl.RegisterUserServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {

    @Autowired
    private RegisterUserServiceImpl service;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("registerServlet执行l");
        String username = request.getParameter("username");
        System.out.println("username:"+username);

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
            message.setMsg("验证码为空");

            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(message);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(json);
            return;
        }

        System.out.println("1");
        //封装注册信息
        Map<String,String[]> map=request.getParameterMap();
        User registerUser=new User();
        System.out.println("2");
        try {
            System.out.println("3");
            BeanUtils.populate(registerUser,map);
            System.out.println("1+"+registerUser);
        } catch (IllegalAccessException e) {
            System.out.println("4");
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            System.out.println("5");
            e.printStackTrace();
        }

        System.out.println("2+"+registerUser);
        Message msg = service.findOne(registerUser);
        service.save(registerUser);

            response.setContentType("application/json;charset=utf-8");
            ObjectMapper mapper=new ObjectMapper();
            mapper.writeValue(response.getWriter(),message);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
