package cn.itcast.dao;

import cn.itcast.domain.Course;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Repository
public interface CourseDao {

    /**
     * 查询课程
     * @return
     */
    @Select("<script>" +
            "select * from course " +
            "where 1=1 " +
            "<if test='search != null and !search.equals(null) '>" +
            "and name like concat('%',#{search},'%')" +
            "</if>" +
            " limit #{start},#{rows} " +
            "</script>")
    List<Course> findCourse(@Param("start") int start,@Param("rows") int rows,@Param("search") String search);

    /**
     * 查询总记录数
     * @return
     */
    @Select("<script>" +
            "select count(id) from course where 1=1" +
            "<if test='search != null' > " +
            "and name like concat('%',#{search},'%')" +
            "</if>" +
            "</script>")
    int selectCounts(@Param("search") String search);

    /**
     * 保存视频点击量
     * @param id
     * @param counts
     */
    @Update("update course set counts=#{counts}  where id=#{id} ")
    void saveCounts(@Param("id")int id,@Param("counts")int counts);

    @Select("select * from course order by counts desc")
    List<Course> findCourseByOrder();
}
