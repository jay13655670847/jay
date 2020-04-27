package com.entity;

import javax.persistence.*;

/**
 * Created by 53191 on 2019/1/9.
 */
@Entity
@Table(name="comment")
public class Comment implements java.io.Serializable{
    private int id;
    private Coach coach;
    private String content;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cid")
    public Coach getCoach() {
        return coach;
    }

    public void setCoach(Coach coach) {
        this.coach = coach;
    }

    @Basic
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
