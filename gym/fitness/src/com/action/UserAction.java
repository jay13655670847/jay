package com.action;

import com.entity.User;
import com.service.UserService;
import com.util.Const;
import com.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 53191 on 2019/1/9.
 */
@Controller
@Scope("prototype")
public class UserAction extends BaseAction {
    @Autowired
    private UserService userService;

    private User user;
    private PageBean pageBean=new PageBean();
    private Integer id;

    //作用域
    private List<User> users = new ArrayList<User>();

    
    
    //用户登录功能
    
    public String login(){
        String userName=user.getUsername();
        String pasword=user.getPassword();
        User user=userService.login(userName,pasword);
    
    ​	//登录成功
    
    ​    if(user!=null){
    ​        session.put("user",user);
    ​        return "index";
    ​    }else {
    ​    	   try {
    
    ​				//登录失败

    ​               response.setContentType("text/html;charset=UTF-8");
    ​               PrintWriter out= response.getWriter();
    ​               out.print("<script> alert('用户名或密码错误！');location.href='"+Const.ROOT+"list.jsp'</script>");
    ​           } catch (IOException e) {
​               e.printStackTrace();
    ​           }
    ​           return null;
    ​    }
    }
    
    //注销用户
    
public String logout(){
        session.remove("user");
        return "index";
    }
    
    
    
    //分页显示用户相关信息
    
    public String list() {
        String hql="from User where 1=1 ";
        String hqlCount="select count(*) from User where 1=1 ";
        pageBean.setTotalCount(userService.getCount(hqlCount));
        users = userService.getAll(hql,pageBean.pageNo,pageBean.pageSize);
        return "user";
    }
    
    
    
//用户注册，通过号码
    
    public String add(){
        String hql="from User where phone=? ";
        users=userService.getByHql(hql,user.getPhone());
        if (users!=null&&users.size()>0){
            try {
    
    ​			//用户已存在
    
    ​            response.setContentType("text/html;charset=UTF-8");
    ​            PrintWriter out= response.getWriter();
    ​            out.print("<script> alert('此电话已注册！');location.href='"+Const.ROOT+"list.jsp'</script>");
    ​        } catch (IOException e) {
    ​            e.printStackTrace();
    ​        }
    ​    }else {
    ​    	user.setFtime(Const.getCurrentDay());
    ​        userService.addUser(user);
    ​        return "index";
    ​    }
    ​    return null;
    }
    
    
    
    //更新用户信息
    
    public String update(){
        userService.updateUser(user);
        session.put("user",user);
        return "index";
    }
    
    
    
    //根据id删除用户信息
    
    public String delete(){
        userService.delById(id);
        return "list";
    }



    public UserService getUserService() {
        return userService;
    }
    
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    
    public User getUser() {
        return user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    
    public PageBean getPageBean() {
        return pageBean;
    }
    
    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }
    
    public List<User> getUsers() {
        return users;
    }
    
    public void setUsers(List<User> users) {
        this.users = users;
    }
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
}
