package com.service.impl;

import com.dao.GenericDao;
import com.entity.Comment;
import com.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/11.
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private GenericDao<Comment> commentDao;

    
    public Comment getCommentById(Integer id) {
        return commentDao.get(Comment.class,id);
    }


    public List<Comment> getAllComment(Integer id) {
        String hql="from Comment where coach.id=?";
        List<Comment> list=commentDao.getByHql(hql,id);
        return list;
    }

  
    public Serializable addComment(Comment comment) {
        return commentDao.add(comment);
    }
}
