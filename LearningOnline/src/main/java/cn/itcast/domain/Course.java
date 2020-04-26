package cn.itcast.domain;

public class Course {
    private int id;
    private String name;//课程名称
    private String counts;//播放次数
    private String img;//图片路径
    private int uid;//User的id
    private String video;

    public Course(){}

    public Course(int id, String name, String counts, String img, int uid, String video) {
        this.id = id;
        this.name = name;
        this.counts = counts;
        this.img = img;
        this.uid = uid;
        this.video = video;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCounts() {
        return counts;
    }

    public void setCounts(String counts) {
        this.counts = counts;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", counts='" + counts + '\'' +
                ", img='" + img + '\'' +
                ", uid=" + uid +
                ", video='" + video + '\'' +
                '}';
    }
}
