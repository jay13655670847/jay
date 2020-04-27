package com.action;

import com.entity.*;
import com.service.CoachService;
import com.service.CourseService;
import com.service.MuscleService;
import com.service.TorderService;
import com.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.SUCCESS;

/**
 * Created by 53191 on 2019/1/12.
 */
@Controller
@Scope("prototype")
public class CourseAction extends BaseAction{

    @Autowired
    private CourseService courseService;
    @Autowired
    private MuscleService muscleService;
    @Autowired
    private CoachService coachService;
    @Autowired
    private TorderService torderService;


    private Course course;
    private Muscle muscle;
    private PageBean pageBean=new PageBean();
    private Integer id;
    
    //作用域
    private List<Course> courses = new ArrayList<Course>();
    private List<Muscle> muscles = new ArrayList<Muscle>();
    private List<Muscle> muscles2 = new ArrayList<Muscle>();
    private List<Coach> coachs = new ArrayList<Coach>();


    //获得所有课程信息
    public String list() {
        String hql="from Course where 1=1 ";
        String hqlCount="select count(*) from Course where 1=1 ";
        pageBean.setTotalCount(courseService.getCount(hqlCount));
        courses = courseService.getAll(hql,pageBean.pageNo,pageBean.pageSize);
        String hql2="from Coach where 1=1 ";
        coachs = coachService.getAll(hql2,pageBean.pageNo,pageBean.pageSize);
        return "course";
    }
    
    //添加课程
    public String add(){
        courseService.addCourse(course);
        return "list";
    }
    
    //根据id得到课程信息
    public String toupdate(){
       course=courseService.getCourseById(id);
        return SUCCESS;
    }
    
    //更新课程信息
    public String doupdate(){
        courseService.updateCourse(course);
        return "list";
    }
    
    //根据id删除课程信息
    public String delete(){
        courseService.delById(id);
        return "list";
    }
    
    //根据对应用户得到相应课程信息，
    public String qlist() {
        String hql="from Course where 1=1 ";
        User user= (User) request.getSession().getAttribute("user");
        courses = courseService.getByHql(hql);
        for(Course course:courses){
            int c=(int)((Math.random()*30)+0);
            course.setSum(c);
        }
        if(user!=null){
        for (int i=0;i<courses.size();i++){
            Course course=courses.get(i);
            String hql2="from Torder where uid=? and cid=?";
            //根据用户和课程信息获得订单信息
            List<Torder> orders=torderService.getByHql(hql2,user.getId(),course.getId());
            if(orders.size()==0){
                course.setJieguo(0);
            }else{
                Torder o=orders.get(0);
                if(o.getResult().equals("未通过")){
                    course.setJieguo(1);
                }else{
                    course.setJieguo(2);
                }
            }
    
        }}
        //获得肌肉相关的课程信息
        String hql3="from Muscle where type='肌肉' ";
        muscles = muscleService.getAll(hql3,pageBean.pageNo,pageBean.pageSize);
        //获得骨骼相关的课程信息
        String hql4="from Muscle where type='骨骼' ";
        muscles2 = muscleService.getAll(hql4,pageBean.pageNo,pageBean.pageSize);
        return "index";
    }




    //获得CourseService对象
    public CourseService getCourseService() {
        return courseService;
    }
    
    //设置setCourseService对象
    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }
    
    //获得课程信息，下同
    public Course getCourse() {
        return course;
    }
    
    //设置课程信息，下同
    public void setCourse(Course course) {
        this.course = course;
    }
    //分页参数的得到方法
    public PageBean getPageBean() {
        return pageBean;
    }
    //分页参数的设置方法
    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }
    //course集合对象的得到方法
    public List<Course> getCourses() {
        return courses;
    }
    //course集合对象的设置方法
    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    //muscle肌肉的得到方法
    public Muscle getMuscle() {
        return muscle;
    }
    //muscle肌肉的设置方法
    public void setMuscle(Muscle muscle) {
        this.muscle = muscle;
    }
    //muscle肌肉集合对象的得到方法
    public List<Muscle> getMuscles() {
        return muscles;
    }
    //muscle肌肉集合对象的设置方法
    public void setMuscles(List<Muscle> muscles) {
        this.muscles = muscles;
    }
    
    public List<Coach> getCoachs() {
        return coachs;
    }
    
    public void setCoachs(List<Coach> coachs) {
        this.coachs = coachs;
    }
    
    public List<Muscle> getMuscles2() {
        return muscles2;
    }
    
    public void setMuscles2(List<Muscle> muscles2) {
        this.muscles2 = muscles2;
    }
}
