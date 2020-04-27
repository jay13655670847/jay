package com.service.impl;

import com.dao.GenericDao;
import com.entity.Admin;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/9.
 */

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private GenericDao<Admin> adminDao;

  
    public Admin login(String username, String password) {
        String hql="from Admin where username=? and password=?";
        List<Admin> list=adminDao.getByHql(hql,username,password);
        if(list.size()>0){
            return list.get(0);
        }else {
            return null;
        }
    }

  
    public List<Admin> getAll(String hql, int page, int pageSize) {
        return adminDao.getByPage(hql,page,pageSize);
    }

 
    public int getCount(String hql) {
        return adminDao.getCount(hql);
    }

  
    public Serializable addAdmin(Admin admin) {
        return adminDao.add(admin);
    }
    
    public Admin getAdminById(Integer id) {
        return adminDao.get(Admin.class,id);
    }
    
    public void updateAdmin(Admin admin) {
        adminDao.update(admin);
    }

    public void delById(Integer id) {
        adminDao.delete(getAdminById(id));
    }
}
