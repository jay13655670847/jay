package cn.itcast.service.impl;

import cn.itcast.dao.RegisterUserDao;
import cn.itcast.domain.Message;
import cn.itcast.domain.User;
import cn.itcast.service.RegisterUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("registerUserServiceImpl")
public class RegisterUserServiceImpl implements RegisterUserService {

    @Autowired
    private RegisterUserDao dao;

    /**
     * 查询用户名是否存在
     * @return
     */
    @Override
    public Message findOne(User registerUser) {
        User user = dao.findOne(registerUser);
        Message message=new Message();
        //查询到用户，用户名存在
        if(user!=null && !user.equals("")){
            message.setFlag(false);
            message.setMsg("用户名重复");
            message.setUser(user);
        }else{
            //用户名不存在
            message.setFlag(true);
            message.setMsg("用户名可用");
            message.setUser(user);
        }

        return message;
    }

    /**
     * 保存用户
     * @param registerUser
     */
    @Override
    public Message save(User registerUser) {

        dao.save(registerUser);
        Message message=new Message();
        message.setFlag(true);
        message.setMsg("注册成功!");

        return message;
    }
}
