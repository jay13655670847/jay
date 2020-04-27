package com.service.impl;

import com.dao.GenericDao;
import com.entity.User;
import com.service.UserService;
import com.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/9.
 */
@Service
public class UsererviceImpl implements UserService{
    @Autowired
    private GenericDao<User> userDao;
   
    public User login(String username, String password) {
        String hql="from User where username=? and password=?";
        List<User> list=userDao.getByHql(hql,username,password);
        if(list.size()>0){
            return list.get(0);
        }else {
            return null;
        }
    }


    public List<User> getAll(String hql, int page, int pageSize) {
        return userDao.getByPage(hql,page,pageSize);
    }

  
    public int getCount(String hql) {
        return userDao.getCount(hql);
    }


    public Serializable addUser(User user) {
        return userDao.add(user);
    }

  
    public User getUserById(Integer id) {
        return userDao.get(User.class,id);
    }


    public void updateUser(User user) {
        userDao.update(user);
    }

  
    public void delById(Integer id) {
        userDao.delete(getUserById(id));
    }

    public List<User> getByHql(String hql, String phone) {
        return userDao.getByHql(hql,phone);
    }

}
