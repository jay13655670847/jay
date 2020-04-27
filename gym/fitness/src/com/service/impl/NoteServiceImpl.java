package com.service.impl;

import com.dao.GenericDao;
import com.entity.Note;
import com.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/12.
 */
@Service
public class NoteServiceImpl implements NoteService{

    @Autowired
    private GenericDao<Note> noteDao;

   
    public List<Note> getAll(String hql, int page, int pageSize) {
        return noteDao.getByPage(hql,page,pageSize);
    }

   
    public int getCount(String hql) {
        return noteDao.getCount(hql);
    }

 
    public Note getNoteById(Integer id) {
        return noteDao.get(Note.class,id);
    }

   
    public Serializable addNote(Note note) {
        return noteDao.add(note);
    }


    public void updateNote(Note note) {
        noteDao.update(note);
    }

 
    public void delById(Integer id) {
        noteDao.delete(getNoteById(id));
    }
}
