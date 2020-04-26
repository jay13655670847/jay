package cn.itcast.service.impl;

import cn.itcast.dao.LoginUserDao;
import cn.itcast.domain.Message;
import cn.itcast.domain.User;
import cn.itcast.service.LoginUserService;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("loginUserServiceImpl")
public class LoginUserServiceImpl implements LoginUserService {

    @Autowired
    private LoginUserDao dao;

    /**
     * 判断是否登录成功
     * @return
     */
    @Override
    public Message isLogin(User loginUser) {
        User user = dao.isLogin(loginUser);

        Message message=new Message();
        //判断user是否为空
        if(user!=null && !user.equals("")){
            message.setFlag(true);
            message.setMsg("登录成功");
            message.setUser(user);
        }else{
            message.setFlag(false);
            message.setMsg("用户名或密码错误，请重新登录!");
        }

        return message;
    }
}
