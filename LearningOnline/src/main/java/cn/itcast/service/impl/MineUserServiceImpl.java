package cn.itcast.service.impl;

import cn.itcast.dao.MineUserDao;
import cn.itcast.domain.Message;
import cn.itcast.domain.User;
import cn.itcast.service.MineUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MineUserServiceImpl implements MineUserService {

    @Autowired
    private MineUserDao dao;

    /**
     * 根据id查询用户信息
     * @param id
     */
    @Override
    public Message findUser(int id) {
        User user = dao.findUser(id);
        Message message=new Message();

        message.setFlag(true);
        message.setUser(user);

        return message;
    }

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @Override
    public Message updateUser(User user) {
        System.out.println("service");
        System.out.println(user);
        dao.updateUser(user);

        Message message=new Message();
        message.setUser(user);
        message.setFlag(true);
        message.setMsg("修改成功");

        return  message;
    }

    /**
     * 修改密码
     * @param id
     * @param password
     * @return
     */
    @Override
    public Message changePassword(int id, String password) {

        dao.changePassword(id, password);
        Message message=new Message();
        message.setFlag(true);
        message.setMsg("修改密码成功");
        return message;
    }


}
