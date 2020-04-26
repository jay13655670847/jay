package cn.itcast.dao;

import cn.itcast.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * 注册接口
 */
@Repository
public interface RegisterUserDao {

    /**
     * 查询用户名是否存在
     * @param registerUser
     * @return
     */
    @Select("select * from user where username=#{username}")
    User findOne(User registerUser);

    @Insert("insert into user (username,password, name, birthday, gender, phone) values ( #{username}, #{password}, #{name}, #{birthday}, #{gender}, #{phone})")
    void save(User registerUser);
}
