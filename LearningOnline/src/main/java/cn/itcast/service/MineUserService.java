package cn.itcast.service;

import cn.itcast.domain.Message;
import cn.itcast.domain.User;

public interface MineUserService {

    Message findUser(int id);

    Message updateUser(User user);

    Message changePassword(int id,String password);
}
