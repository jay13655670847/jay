package com.entity;

import javax.persistence.*;

/**
 * Created by 53191 on 2019/1/9.
 */
@Entity
@Table(name="course")
public class Course implements java.io.Serializable{
    private int id;
    private String content;
    private String price;
    private String clazz;
    private Coach coach;

    @Transient
    private Integer jieguo;
    @Transient
    private Integer sum;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
    @Column(name = "clazz")
    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cid")
    public Coach getCoach() {
        return coach;
    }

    public void setCoach(Coach coach) {
        this.coach = coach;
    }

    @Transient
    public Integer getJieguo() {
        return jieguo;
    }

    public void setJieguo(Integer jieguo) {
        this.jieguo = jieguo;
    }
    
    @Transient
    public Integer getSum() {
        return sum;
    }

    public void setSum(Integer sum) {
        this.sum = sum;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Course course = (Course) o;

        if (id != course.id) return false;
        if (clazz != course.clazz) return false;
        if (content != null ? !content.equals(course.content) : course.content != null) return false;
        if (price != null ? !price.equals(course.price) : course.price != null) return false;

        return true;
    }

}
