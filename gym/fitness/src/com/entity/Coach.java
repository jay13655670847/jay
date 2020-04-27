package com.entity;

import javax.persistence.*;

/**
 * Created by 53191 on 2019/1/9.
 */
@Entity
@Table(name="coach")
public class Coach implements java.io.Serializable{
    private int id;
    private String name;
    private int age;
    private String exp;
    private String credential;
    private String price;
    private String photo;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "age")
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Basic
    @Column(name = "exp")
    public String getExp() {
        return exp;
    }

    public void setExp(String exp) {
        this.exp = exp;
    }

    @Basic
    @Column(name = "credential")
    public String getCredential() {
        return credential;
    }

    public void setCredential(String credential) {
        this.credential = credential;
    }

    @Basic
    @Column(name = "price")
    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    @Basic
    @Column(name = "photo")
    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Coach coach = (Coach) o;

        if (id != coach.id) return false;
        if (age != coach.age) return false;
        if (name != null ? !name.equals(coach.name) : coach.name != null) return false;
        if (exp != null ? !exp.equals(coach.exp) : coach.exp != null) return false;
        if (credential != null ? !credential.equals(coach.credential) : coach.credential != null) return false;
        if (price != null ? !price.equals(coach.price) : coach.price != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + age;
        result = 31 * result + (exp != null ? exp.hashCode() : 0);
        result = 31 * result + (credential != null ? credential.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        return result;
    }
}
