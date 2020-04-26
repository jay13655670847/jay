package cn.itcast.domain;

import javax.jws.soap.SOAPBinding;

public class Message {

    private String msg;
    private Boolean flag;
    private User user;

    public Message(){}

    public Message(String msg, Boolean flag, User user) {
        this.msg = msg;
        this.flag = flag;
        this.user = user;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Message{" +
                "msg='" + msg + '\'' +
                ", flag=" + flag +
                ", user=" + user +
                '}';
    }
}
