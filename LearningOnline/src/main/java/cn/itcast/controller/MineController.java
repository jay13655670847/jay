package cn.itcast.controller;

import cn.itcast.domain.Message;
import cn.itcast.domain.User;
import cn.itcast.service.impl.MineUserServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

@Controller
@RequestMapping("/mineController")
public class MineController {

    @Autowired
    private MineUserServiceImpl service;

    /**
     * 查询用户信息
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/findUser")
    public void findUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("findUser");
        response.setContentType("text/html;charset=utf-8");

        int id = Integer.parseInt(request.getParameter("id"));

        request.getSession().setAttribute("id",id);

        Message message = service.findUser(id);

        ObjectMapper mapper=new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getWriter(),message);
    }


    @RequestMapping("/updateUser")
    public void updateUser(HttpServletRequest request,HttpServletResponse response,User user) throws IOException {
        System.out.println("updateUser");
        response.setContentType("text/html;charset=utf-8");

        int id = (int) request.getSession().getAttribute("id");

        System.out.println("updateUser"+id);

        user.setId(id);
        System.out.println(user);

        Message message = service.updateUser(user);

        ObjectMapper mapper=new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getWriter(),message);
    }

    @RequestMapping("/changePassword")
    public void changePassword(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");

        User user = (User) request.getSession().getAttribute("user");
        int id = user.getId();

        String password = request.getParameter("password");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");

        //判断两次新密码是否一样
        if(password1.equals(password2)){
            //判断原始密码是否输入错误
            if(password.equals(user.getPassword())){
                //修改成功
                Message message = service.changePassword(id, password1);

                ObjectMapper mapper=new ObjectMapper();
                response.setContentType("application/json;charset=utf-8");
                mapper.writeValue(response.getWriter(),message);
            }else {
                Message message=new Message();
                message.setFlag(false);
                message.setMsg("原密码错误，请重新输入！");

                ObjectMapper mapper=new ObjectMapper();
                response.setContentType("application/json;charset=utf-8");
                mapper.writeValue(response.getWriter(),message);
            }

        }else{
            Message message=new Message();
            message.setFlag(false);
            message.setMsg("两次新密码不一样，请重新输入！");

            ObjectMapper mapper=new ObjectMapper();
            response.setContentType("application/json;charset=utf-8");
            mapper.writeValue(response.getWriter(),message);
        }

    }

    @RequestMapping("/exitLogin")
    public void exitLogin(HttpServletRequest request,HttpServletResponse response){
        request.getSession().removeAttribute("user");
    }

    @RequestMapping("/videoUpload")
    @ResponseBody
    public void videoUpload(HttpServletRequest request, HttpServletResponse response,@RequestParam(value="upload",required=false) MultipartFile upload) throws IOException {
       response.setContentType("text/html;charset=utf-8");
        //上传位置,存放在项目之外，不然每次重启服务器，就会覆盖掉
        String pathwebapp = request.getSession().getServletContext().getRealPath("");
        //D:\Tomcat\apache-tomcat-8.5.50\webapps\LearningOnline\video
        pathwebapp = pathwebapp.substring(0,pathwebapp.lastIndexOf("\\"));
        pathwebapp = pathwebapp.substring(0,pathwebapp.lastIndexOf("\\"));
        //D:\Tomcat\apache-tomcat-8.5.50\webapps
        pathwebapp=pathwebapp+"/upload/";

        //判断路径是否存在，不存在就创建
        File file=new File(pathwebapp);
        if(!file.exists()){
            file.mkdirs();
        }


        //获取上传文件的名称
        String filename = upload.getOriginalFilename();
        //设置上传文件唯一名称
        String uuid = UUID.randomUUID().toString().replace("_", "");
        filename=uuid+"_"+filename;
        //完成上传
        upload.transferTo(new File(pathwebapp,filename));

        Message message=new Message();
        message.setMsg("视频上传成功");
        message.setFlag(true);

        ObjectMapper mapper=new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getWriter(),message);

    }
}
