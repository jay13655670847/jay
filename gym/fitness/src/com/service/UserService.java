package com.service;

import com.entity.User;
import com.util.PageBean;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/9.
 */
public interface UserService {
    public User login(String username,String password);

    public List<User> getAll(String hql, int page, int pageSize);

    public int getCount(String hql);

    public Serializable addUser(User user);

    public User getUserById(Integer id);

    public void updateUser(User user);

    public void delById(Integer id);
    
    public List<User> getByHql(String hql, String phone);
}
