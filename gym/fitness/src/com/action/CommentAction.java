package com.action;

import com.entity.Coach;
import com.entity.Comment;
import com.service.CoachService;
import com.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * Created by 53191 on 2019/1/11.
 */
@Controller
@Scope("prototype")
public class CommentAction extends BaseAction{

    @Autowired
    private CommentService commentService;
    @Autowired
    private CoachService coachService;


    private CommentAction commentAction;
    private Comment comment;
    
    //作用域
    private List<Comment> comments;
    
    private Integer id;
    
    //根据id得到所有相关评论信息
    public String listById(){
        comments=commentService.getAllComment(id);
        return "coumentListJson";
    }
    
    //添加评论
    public String add(){
        Coach coach=coachService.getCoachById(id);
        comment.setCoach(coach);
        commentService.addComment(comment);
        return "index";
    }
    
    //得到CommentAction对象，下同
    public CommentAction getCommentAction() {
        return commentAction;
    }
    
    //设置CommentAction对象，下同
    public void setCommentAction(CommentAction commentAction) {
        this.commentAction = commentAction;
    }
    //得到id
    public Integer getId() {
        return id;
    }
    //设置id
    public void setId(Integer id) {
        this.id = id;
    }
    //得到comment集合对象的方法
    public List<Comment> getComments() {
        return comments;
    }
    //设置comment集合对象的方法
    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
    //得到comment的方法
    public Comment getComment() {
        return comment;
    }
    //设置comment的方法
    public void setComment(Comment comment) {
        this.comment = comment;
    }
}
