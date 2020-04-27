package com.action;

import com.entity.Note;
import com.entity.User;
import com.service.NoteService;
import com.util.Const;
import com.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 53191 on 2019/1/12.
 */
@Controller
@Scope("prototype")
public class NoteAction {

    @Autowired
    private NoteService noteService;

    private Note note;
    private PageBean pageBean=new PageBean();
    private Integer id;
    private String anote;

    //作用域
    private List<Note> notes = new ArrayList<Note>();


    //分页显示备注(note)信息
    public String list() {
        String hql="from Note where 1=1 ";
        String hqlCount="select count(*) from Note where 1=1 ";
        pageBean.setTotalCount(noteService.getCount(hqlCount));
        notes = noteService.getAll(hql,pageBean.pageNo,pageBean.pageSize);
        return "note";
    }
    
    //根据id查找note信息，并进行更新
    public String doupdate(){
        note=noteService.getNoteById(id);
        note.setAnote(anote);
        note.setAtime(Const.getCurrentTime());
        noteService.updateNote(note);
        return "list";
    }
    
    //删除note相关信息
    public String delete(){
        noteService.delById(id);
        return "list";
    }
    
    //添加note相关信息
    public String add(){
        User user=new User();
        user.setId(id);
        note.setUser(user);
        note.setUtime(Const.getCurrentTime());
        noteService.addNote(note);
        return "index";
    }


    public NoteService getNoteService() {
        return noteService;
    }
    
    public void setNoteService(NoteService noteService) {
        this.noteService = noteService;
    }
    //得到留言的方法，用户的留言
    public Note getNote() {
        return note;
    }
    //设置留言的方法，note是指用户的留言
    public void setNote(Note note) {
        this.note = note;
    }
    //分页参数对象得到方法，note是指用户的留言
    public PageBean getPageBean() {
        return pageBean;
    }
    //分页参数的设置方法
    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }
    //notes集合对象的得到方法
    public List<Note> getNotes() {
        return notes;
    }
    
    public void setNotes(List<Note> notes) {
        this.notes = notes;
    }
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    //得到管理员的回复，Anote是指管理员对用户留意的回复
    public String getAnote() {
        return anote;
    }
    //设置管理员的回复，Anote是指管理员对用户留言的回复
    public void setAnote(String anote) {
        this.anote = anote;
    }
}
