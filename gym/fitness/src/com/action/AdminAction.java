package com.action;

import com.entity.Admin;
import com.service.AdminService;
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
//从BaseAction里面继承，BaseAction中存放通用的方法和功能，用的是Struts框架
public class AdminAction extends BaseAction {

    @Autowired
    private Admin adminService;


    private Admin admin;
    private PageBean pageBean=new PageBean();
    private Integer id;


    //作用域（只在这个范围里面有用）
    private List<Admin> admins = new ArrayList<Admin>();


    //管理员登录操作
    public String login(){
    	//获取管理员名称，密码
        String userName=admin.getUsername();
        String pasword=admin.getPassword();
        //调用登录函数
        Admin admin=adminService.login(userName,pasword);
        //如果登录成功
        if(admin!=null){
        	//把登录信息保存到session
            session.put("admin",admin);
            return "list";
        }else {
            try {
                //登录失败，显示相关信息，并跳转到登录页面
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out= response.getWriter();
                out.print("<script> alert('用户名或密码错误！');location.href='"+ Const.ROOT+"managers/login.jsp'</script>");
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }
    }
    
    //获得所有admin信息
    public String list() {
        String hql="from Admin where 1=1 ";
        String hqlCount="select count(*) from Admin where 1=1 ";
        pageBean.setTotalCount(adminService.getCount(hqlCount));
        admins = adminService.getAll(hql,pageBean.pageNo,pageBean.pageSize);
        return "index";
    }
    
    //管理员注册
    public String add(){
        adminService.addAdmin(admin);
        return "list";
    }
    
    //通过id查找管理员
    public String toupdate(){
        admin =adminService.getAdminById(id);
        return SUCCESS;
    }
    
    //更新管理员信息
    public String doupdate(){
        adminService.updateAdmin(admin);
        return "list";
    }
    
    //根据id删除管理员信息
    public String delete(){
    	adminService.delById(id);
        return "list";
    }
    
    //获取AdminService对象
    public AdminService getAdminService() {
        return adminService;
    }
    //设置AdminService对象
    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }
    
    //Admin对象的get方法
    //获取Admin对象，下同
    public Admin getAdmin() {
        return admin;
    }
    
    //Admin对象的set方法
    //设置Admin对象，下同
    public void setAdmin(Admin admin) {
        this.admin = admin;
    }
    
    //分页参数对象的get方法
    public PageBean getPageBean() {
        return pageBean;
    }
    
    //分页参数对象的set方法
    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }
    
    //Admin集合对象的get方法
    public List<Admin> getAdmins() {
        return admins;
    }
    
    //Admin集合对象的set方法
    public void setAdmins(List<Admin> admins) {
        this.admins = admins;
    }
    
    //Id的get方法
    public Integer getId() {
        return id;
    }
    
    //Id的set方法
    public void setId(Integer id) {
        this.id = id;
    }
}
