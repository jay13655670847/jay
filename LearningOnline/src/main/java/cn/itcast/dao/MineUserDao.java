package cn.itcast.dao;

import cn.itcast.domain.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface MineUserDao {

    /**
     * 根据id查询用户信息
     * @param id
     */
    @Select("select * from user where id=#{id}")
    User findUser(@Param("id") int id);

    /**
     * 修改用户信息
     * @param user
     */
    @Update("update user set username=#{username},name=#{name},phone=#{phone},gender=#{gender} where id=#{id}")
    void updateUser( User user);

    /**
     * 修改密码
     * @param id
     * @param password
     */
    @Update("update user set password=#{password} where id=#{id}")
    void changePassword(@Param("id") int id,@Param("password") String password);
}
