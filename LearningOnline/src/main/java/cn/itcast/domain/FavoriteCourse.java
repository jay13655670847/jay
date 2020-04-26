package cn.itcast.domain;

import java.io.Serializable;

public class FavoriteCourse implements Serializable {

    private int id;
    private int uid;
    private int cid;
    private String name;
    private String img;
    private String video;

    public FavoriteCourse(){};

    public FavoriteCourse(int id, int uid, int cid, String name, String img, String video) {
        this.id = id;
        this.uid = uid;
        this.cid = cid;
        this.name = name;
        this.img = img;
        this.video = video;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    @Override
    public String toString() {
        return "FavoriteCourse{" +
                "id=" + id +
                ", uid=" + uid +
                ", cid=" + cid +
                ", name='" + name + '\'' +
                ", img='" + img + '\'' +
                ", video='" + video + '\'' +
                '}';
    }
}
