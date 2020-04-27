package com.action;

import com.entity.Course;
import com.entity.Torder;
import com.entity.User;
import com.service.CourseService;
import com.service.TorderService;
import com.service.UserService;
import com.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 53191 on 2019/1/12.
 */
@Controller
@Scope("prototype")
public class TorderAction extends BaseAction{

    @Autowired
    private TorderService torderService;


    private Torder torder;
    private PageBean pageBean=new PageBean();
    private Integer id;
    private Integer uid;


    //作用域
    private List<Torder> torders = new ArrayList<Torder>();


    //分页查找torder信息
    public String list() {
        String hql="from Torder where 1=1 ";
        String hqlCount="select count(*) from Torder where 1=1 ";
        pageBean.setTotalCount(torderService.getCount(hqlCount));
        torders = torderService.getAll(hql,pageBean.pageNo,pageBean.pageSize);
        return "torder";
    }
    
    //根据id查找torder相关信息并进行更新
    public String doupdate(){
        torder=torderService.getTorderById(id);
        torder.setResult("已通过");
        torderService.updateTorder(torder);
        return "list";
    }
    
    //添加torder信息
    public String add(){
        User user=new User();
        user.setId(id);
        Course course=new Course();
        course.setId(uid);
        Torder torder=new Torder();
        torder.setUser(user);
        torder.setCourse(course);
        torder.setResult("未通过");
        torderService.addTorder(torder);
        return "index";
    }




    public TorderService getTorderService() {
        return torderService;
    }
    
    public void setTorderService(TorderService torderService) {
        this.torderService = torderService;
    }
    
    public Torder getTorder() {
        return torder;
    }
    
    public void setTorder(Torder torder) {
        this.torder = torder;
    }
    
    public PageBean getPageBean() {
        return pageBean;
    }
    
    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }
    
    public List<Torder> getTorders() {
        return torders;
    }
    
    public void setTorders(List<Torder> torders) {
        this.torders = torders;
    }
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    public Integer getUid() {
        return uid;
    }
    
    public void setUid(Integer uid) {
        this.uid = uid;
    }
}
