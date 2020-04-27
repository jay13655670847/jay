package com.action;

import com.alibaba.fastjson.JSONObject;
import com.entity.Coach;
import com.service.CoachService;
import com.util.Const;
import com.util.PageBean;
import com.util.PageBean01;
import org.apache.commons.io.FileUtils;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 53191 on 2019/1/11.
 */

@Controller
@Scope("prototype")
public class CoachAction extends BaseAction{

    @Autowired
    private CoachService coachService;
    
    private Coach coach;
    private PageBean pageBean=new PageBean();
    private Integer id;
    private File file;
    private String fileFileName;
    
    //作用域
    private List<Coach> coachs = new ArrayList<Coach>();
    private PageBean01<Coach> pageBean01;


    //获得所有教练信息
    public String list() {
        String hql="from Coach where 1=1 ";
        String hqlCount="select count(*) from Coach where 1=1 ";
        pageBean.setTotalCount(coachService.getCount(hqlCount));
        coachs = coachService.getAll(hql,pageBean.pageNo,pageBean.pageSize);
        return "coach";
    }
    
    //教练注册
    public String add(){
            String path = request.getSession().getServletContext().getRealPath("/images");
            //将上传文件保存到一个目标文件当中
            File lujing=new File(path);
            try {
                FileUtils.copyFile(file,new File(lujing,fileFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            coach.setPhoto(fileFileName);
            coachService.addCoach(coach);
        return "list";
    }
    
    //根据id得到教练信息
    public String toupdate(){
        coach =coachService.getCoachById(id);
        return SUCCESS;
    }
    
    //更新教练信息
    public String doupdate(){
        coachService.updateCoach(coach);
        return "list";
    }
    
    //根据id删除教练信息
    public String delete(){
        coachService.delById(id);
        return "list";
    }
    
    //分页得到教练信息
    public String qlist() {
        String hql="from Coach where 1=1 ";
        String hqlCount="select count(*) from Coach where 1=1 ";
        pageBean.pageSize=3;
        pageBean.setTotalCount(coachService.getCount(hqlCount));
        coachs = coachService.getAll(hql,pageBean.pageNo,pageBean.pageSize);
        return "index";
    }
    
    //通过分页得到教练信息，并通过json格式显示到页面上
    public String qjsonlist() {
        String hql="from Coach where 1=1 ";
        String hqlCount="select count(*) from Coach where 1=1 ";
        pageBean.setPageSize(3);
        pageBean.setTotalCount(coachService.getCount(hqlCount));
        coachs = coachService.getAll(hql,pageBean.pageNo,pageBean.pageSize);

、
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out= response.getWriter();


            StringBuffer result=new StringBuffer();
            result.append(" <h3>我们的团队</h3>\n" +
                    "            <div class=\"row\">\n");
           //遍历所有获得的教练，通过for循环遍历
            for(int i=0;i<coachs.size();i++){
                Coach coach=coachs.get(i);
                result.append("<div class=\"col-md-4 trainer-grid-text\"><div style=\" background-image: url("+Const.ROOT+"images/"+coach.getPhoto()+"); background-size:contain;\"  class=\"ch-item ch-img-"+(i+1)+"\">\n" +
                    "                                <div class=\"ch-info\">\n" +
                    "                                    <h3>"+coach.getName()+"<br>\n" +
                    "                                        "+coach.getAge()+"岁\n" +
                    "                                    </h3>\n" +
                    "                                    <p style=\"color: white\">私教价格：￥"+coach.getPrice()+"<br>\n" +
                    "                                        <button class=\"btn btn-success btn-xs\" onclick=\"todelete('"+coach.getId()+"')\">查看评价</button><button class=\"btn btn-warning btn-xs\" onclick=\"addcom('"+coach.getId()+"')\">评价</button>\n" +
                    "                                    </p>\n" +
                    "                                </div>\n" +
                    "                            </div>\n" +
                    "                            <h4>"+coach.getCredential()+"</h4>\n" +
                    "                            <p>"+coach.getExp()+"</p>\n" +
                    "                        </div>\n");
            }
            result.append( "                  <div class=\"clearfix\"></div>\n" +
                    "            </div>\n" +
                    "                <button style=\"float: left;\" class=\"button button-action button-circle button-giant\" onclick=\"goPage('"+pageBean.getPrePage()+"')\"><i class=\"fa fa-angle-left\"><</i></button>\n" +
                    "                <button style=\"float: right;\" class=\"button button-action button-circle button-giant\" onclick=\"goPage('"+pageBean.getNextPage()+"')\"><i class=\"fa fa-angle-right\">></i></button>\n"
            );


            out.print(result);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    
        return null;
    }




    //得到CoachService对象，下同 (get方法是得到xxx属性)
    public CoachService getCoachService() {
        return coachService;
    }
    
    //设置CoachService对象，下同 (set方法是设置xxx属性)
    public void setCoachService(CoachService coachService) {
        this.coachService = coachService;
    }
    //得到coach对象
    public Coach getCoach() {
        return coach;
    }
    //设置coach对象
    public void setCoach(Coach coach) {
        this.coach = coach;
    }
    //得到分页参数对象的方法
    public PageBean getPageBean() {
        return pageBean;
    }
    //设置分页参数的方法
    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }
    //coach集合对象的得到方法
    public List<Coach> getCoachs() {
        return coachs;
    }
    //coach集合对象的设置方法
    public void setCoachs(List<Coach> coachs) {
        this.coachs = coachs;
    }
    //得到id
    public Integer getId() {
        return id;

    public void setId(Integer id) {
        this.id = id;
    }
    
    public PageBean01<Coach> getPageBean01() {
        return pageBean01;
    }
    
    public void setPageBean01(PageBean01<Coach> pageBean01) {
        this.pageBean01 = pageBean01;
    }
    //得到文件
    public File getFile() {
        return file;
    }
    //设置文件
    public void setFile(File file) {
        this.file = file;
    }
    //得到文件名
    public String getFileFileName() {
        return fileFileName;
    }
    //设置文件名
    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }
}
