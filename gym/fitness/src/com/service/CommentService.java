package com.service;

import com.entity.Comment;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/11.
 */
public interface CommentService {

    public Comment getCommentById(Integer id);

    public List<Comment> getAllComment(Integer id);

    public Serializable addComment(Comment comment);
}
