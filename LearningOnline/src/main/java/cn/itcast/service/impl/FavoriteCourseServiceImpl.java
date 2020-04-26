package cn.itcast.service.impl;

import cn.itcast.dao.FavoriteCourse;
import cn.itcast.domain.Course;
import cn.itcast.domain.Message;
import cn.itcast.service.FavoriteCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FavoriteCourseServiceImpl implements FavoriteCourseService {

    @Autowired
    private FavoriteCourse favoriteCourseDao;


    /**
     * 收藏课程
     * @param id
     * @return
     */
    @Override
    public Message favoriteCourse(int id,int uid) {
        Course course = favoriteCourseDao.findCourse(id);

        cn.itcast.domain.FavoriteCourse favoriteCourse=new cn.itcast.domain.FavoriteCourse();
        favoriteCourse.setCid(id);
        favoriteCourse.setUid(uid);
        favoriteCourse.setName(course.getName());
        favoriteCourse.setImg(course.getImg());
        favoriteCourse.setVideo(course.getVideo());

        favoriteCourseDao.favoriteCourse(favoriteCourse);

        Message message=new Message();
        message.setFlag(true);
        message.setMsg("收藏成功");

        return message;
    }

    /**
     * 查询所有收藏课程信息
     * @param uid
     * @return
     */
    @Override
    public List<cn.itcast.domain.FavoriteCourse> findAllCourse(int uid) {
        List<cn.itcast.domain.FavoriteCourse> list = favoriteCourseDao.findAllCourse(uid);
        return list;
    }

    /**
     * 判断是否收藏
     * @param cid
     * @param uid
     * @return
     */
    @Override
    public Message checkFavorite(int cid, int uid) {
        List<cn.itcast.domain.FavoriteCourse> list = favoriteCourseDao.checkFavorite(cid, uid);

        Message message=new Message();
        if(list!=null && list.size()!=0){
            message.setFlag(false);
            message.setMsg("已收藏");
        }else{
            message.setFlag(true);
            message.setMsg("未收藏");
        }

        return message;
    }


}
