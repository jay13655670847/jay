package cn.itcast.dao;

import cn.itcast.domain.Course;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("favoriteCourseDao")
public interface FavoriteCourse {

    /**
     * 收藏课程
     * @param favoriteCourse
     */
    @Insert("insert into favoritecourse values (null,#{name},#{img},#{video},#{uid},#{cid})")
    void favoriteCourse(cn.itcast.domain.FavoriteCourse favoriteCourse);

    /**
     * 查询单个课程信息
     * @param id
     * @return
     */
    @Select("select * from course where id=#{id}")
    Course findCourse(int id);

    /**
     * 查询所有收藏课程信息
     * @param uid
     * @return
     */
    @Select("select * from favoritecourse where uid=#{uid}")
    List<cn.itcast.domain.FavoriteCourse> findAllCourse(int uid);

    /**
     * 判断是否收藏
     * @param cid
     * @param uid
     * @return
     */
    @Select("select * from favoritecourse where cid=#{cid} and uid=#{uid}")
    List<cn.itcast.domain.FavoriteCourse> checkFavorite(@Param("cid") int cid, @Param("uid") int uid);
}
