package com.action;

import com.entity.Muscle;
import com.service.MuscleService;
import com.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 53191 on 2019/1/13.
 */
@Controller
@Scope("prototype")
public class MuscleAction extends BaseAction{

    @Autowired
    private MuscleService muscleService;

    private Muscle muscle;
    private PageBean pageBean=new PageBean();
    private Integer id;


    //作用域
    private List<Muscle> muscles = new ArrayList<Muscle>();



    //分页查找肌肉相关信息
    public String list() {
        String hql="from Muscle where 1=1 ";
        String hqlCount="select count(*) from Muscle where 1=1 ";
        pageBean.setTotalCount(muscleService.getCount(hqlCount));
        muscles = muscleService.getAll(hql,pageBean.pageNo,pageBean.pageSize);
        return "muscle";
    }
    
    //添加肌肉相关信息
    public String add(){
        muscleService.addMuscle(muscle);
        return "list";
    }
    
    //根据id查找肌肉相关信息
    public String toupdate(){
        muscle =muscleService.getMuscleById(id);
        return SUCCESS;
    }
    
    //更新肌肉相关信息
    public String doupdate(){
        muscleService.updateMuscle(muscle);
        return "list";
    }
    
    //根据id删除相关信息
    public String delete(){
        muscleService.delById(id);
        return "list";
    }



     //得到muscleService对象
    public MuscleService getMuscleService() {
        return muscleService;
    }
    //设置musleService对象
    public void setMuscleService(MuscleService muscleService) {
        this.muscleService = muscleService;
    }
    //得到Muscle对象
    public Muscle getMuscle() {
        return muscle;
    }
    //设置Muscle对象
    public void setMuscle(Muscle muscle) {
        this.muscle = muscle;
    }
    //分页参数对象的得到方法
    public PageBean getPageBean() {
        return pageBean;
    }
    //分页参数对象的设置方法
    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    //Muscle集合对象的得到方法
    public List<Muscle> getMuscles() {
        return muscles;
    }
    //Muscle集合对象的设置方法
    public void setMuscles(List<Muscle> muscles) {
        this.muscles = muscles;
    }
}
