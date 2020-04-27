package com.entity;

import javax.persistence.*;

/**
 * Created by 53191 on 2019/1/9.
 */
@Entity
//Table是数据库控件在web页面上创建表格,可以用动态的内容以编程的方式来生成表格。
@Table(name="admin")
public class Admin implements java.io.Serializable {
    private int id;
    private String username;
    private String password;

    @Id
    //Column用来标识实体类中属性与数据表中字段的对应关系
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    //BASIC是一种直译式的编程语言，在完成编写后不用编译及连结等手续即可执行单独执行时仍然需要将其建立成执行档
    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    //@Override是伪代码，所以是可写可不写的．它表示方法重写
    @Override
    //public boolean equals(Object obj)指示一些其他对象是否等于此
    public boolean equals(Object o) {
        if (this == o) return true;// 如果相等,则返回true
            if (o == null || getClass() != o.getClass()) return false;// 如果指定对象为空

        Admin admin = (Admin) o;

        if (id != admin.id) return false;
        if (username != null ? !username.equals(admin.username) : admin.username != null) return false;
        if (password != null ? !password.equals(admin.password) : admin.password != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        return result;
    }
}
