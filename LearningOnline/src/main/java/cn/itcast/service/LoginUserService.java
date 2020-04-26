package cn.itcast.service;

import cn.itcast.domain.Message;
import cn.itcast.domain.User;

import javax.jws.soap.SOAPBinding;

public interface LoginUserService {

    Message isLogin(User loginUser);
}
