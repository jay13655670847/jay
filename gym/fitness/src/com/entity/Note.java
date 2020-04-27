package com.entity;

import javax.persistence.*;

/**
 * Created by 53191 on 2019/1/9.
 */
@Entity
@Table(name="note")
public class Note implements java.io.Serializable{
    private int id;
    private User user;
    private String unote;
    private String utime;
    private String anote;
    private String atime;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "uid")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Basic
    @Column(name = "unote")
    public String getUnote() {
        return unote;
    }

    public void setUnote(String unote) {
        this.unote = unote;
    }

    @Basic
    @Column(name = "utime")
    public String getUtime() {
        return utime;
    }

    public void setUtime(String utime) {
        this.utime = utime;
    }

    @Basic
    @Column(name = "anote")
    public String getAnote() {
        return anote;
    }

    public void setAnote(String anote) {
        this.anote = anote;
    }

    @Basic
    @Column(name = "atime")
    public String getAtime() {
        return atime;
    }

    public void setAtime(String atime) {
        this.atime = atime;
    }


}
