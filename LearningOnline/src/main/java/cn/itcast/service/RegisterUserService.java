package cn.itcast.service;

import cn.itcast.domain.Message;
import cn.itcast.domain.User;

public interface RegisterUserService {

    Message findOne(User registerUser);

    Message save(User registerUser);
}
