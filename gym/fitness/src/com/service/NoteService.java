package com.service;

import com.entity.Note;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/12.
 */
public interface NoteService {

    public List<Note> getAll(String hql, int page, int pageSize);

    public int getCount(String hql);

    public Note getNoteById(Integer id);

    public Serializable addNote(Note note);

    public void updateNote(Note note);

    public void delById(Integer id);
}
