package com.service;

import com.entity.Admin;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/9.
 */
public interface AdminService {
    public Admin login(String username, String password);

    public List<Admin> getAll(String hql, int page, int pageSize);

    public int getCount(String hql);

    public Serializable addAdmin(Admin admin);
    
    public Admin getAdminById(Integer id);
    
    public void updateAdmin(Admin admin);

    public void delById(Integer id);
}
