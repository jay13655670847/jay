package com.entity;

import javax.persistence.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 53191 on 2019/1/9.
 */
@Entity
@Table(name="user")
public class User implements java.io.Serializable{
    private int id;
    private String username;
    private String password;
    private String name;
    private String sex;
    private String phone;
    private String height;
    private String weight;
    private int age;
    private String ftime;
    private String ltime;

    @Transient
    private boolean daoqi;


    @Id
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

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "sex")
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Basic
    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "height")
    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    @Basic
    @Column(name = "weight")
    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    @Basic
    @Column(name = "age")
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Basic
    @Column(name = "ftime")
    public String getFtime() {
        return ftime;
    }

    public void setFtime(String ftime) {
        this.ftime = ftime;
    }

    @Basic
    @Column(name = "ltime")
    public String getLtime() {
        return ltime;
    }

    public void setLtime(String ltime) {
        this.ltime = ltime;
    }

    @Transient
    public boolean isDaoqi() {
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date ldate=format.parse(getLtime());
            Date now=new Date();
            daoqi=now.after(ldate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return daoqi;
    }

    public void setDaoqi(boolean daoqi) {
        this.daoqi = daoqi;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (id != user.id) return false;
        if (age != user.age) return false;
        if (username != null ? !username.equals(user.username) : user.username != null) return false;
        if (password != null ? !password.equals(user.password) : user.password != null) return false;
        if (name != null ? !name.equals(user.name) : user.name != null) return false;
        if (sex != null ? !sex.equals(user.sex) : user.sex != null) return false;
        if (phone != null ? !phone.equals(user.phone) : user.phone != null) return false;
        if (height != null ? !height.equals(user.height) : user.height != null) return false;
        if (weight != null ? !weight.equals(user.weight) : user.weight != null) return false;
        if (ftime != null ? !ftime.equals(user.ftime) : user.ftime != null) return false;
        if (ltime != null ? !ltime.equals(user.ltime) : user.ltime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (sex != null ? sex.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (height != null ? height.hashCode() : 0);
        result = 31 * result + (weight != null ? weight.hashCode() : 0);
        result = 31 * result + age;
        result = 31 * result + (ftime != null ? ftime.hashCode() : 0);
        result = 31 * result + (ltime != null ? ltime.hashCode() : 0);
        return result;
    }
}
