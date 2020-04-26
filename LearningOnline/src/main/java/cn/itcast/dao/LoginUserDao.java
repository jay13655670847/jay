package cn.itcast.dao;

import cn.itcast.domain.User;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * 登录接口
 */
@Repository
public interface LoginUserDao {

    /**
     * 判断登录是否成功
     * @return LoginUser对象
     */

    @Select("select * from user where username=#{username} and password=#{password}")
    User isLogin(User loginUser);
}
