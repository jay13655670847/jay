package com.action;

import com.entity.News;
import com.entity.Note;
import com.service.NewsService;
import com.service.NoteService;
import com.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 53191 on 2019/1/11.
 */
@Controller
@Scope("prototype")
public class NewsAction extends BaseAction{

    @Autowired
    private NewsService newsService;
    @Autowired
    private NoteService noteService;

    private News news;
    private PageBean pageBean=new PageBean();
    private Integer id;

    //作用域
    private List<News> newss = new ArrayList<News>();
    private List<Note> notes = new ArrayList<Note>();

    
    
    //分页查找新闻相关信息
    
    public String list() {
        String hql="from News where 1=1 ";
        String hqlCount="select count(*) from News where 1=1 ";
    pageBean.setTotalCount(newsService.getCount(hqlCount));
        newss = newsService.getAll(hql,pageBean.pageNo,pageBean.pageSize);
        return "news";
    }
    

    
    //添加新闻
    
    public String add(){
    newsService.addNews(news);
        return "list";
    }
    
    

    //根据id查找相关新闻
    
    public String toupdate(){
        news =newsService.getNewsById(id);
    return SUCCESS;
    }
    
    public String doupdate(){
        newsService.updateNews(news);
        return "list";
    }
    
    
    
    //删除新闻
    
public String delete(){
        newsService.delById(id);
        return "list";
    }

    
    
    //根据id降序，分页查找新闻相关信息

    public String qlist() {
        String hql="from News where 1=1 ";
        String hqlCount="select count(*) from News where 1=1 ";
    pageBean.setTotalCount(newsService.getCount(hqlCount));
        newss = newsService.getAll(hql,pageBean.pageNo,pageBean.pageSize);
        String hql2="from Note where 1=1 order by id desc";
        String hqlCount2="select count(*) from Note where 1=1 ";
    pageBean.setTotalCount(noteService.getCount(hqlCount2));
        notes = noteService.getAll(hql2,pageBean.pageNo,pageBean.pageSize);
        return "about";
    }

    public NewsService getNewsService() {
        return newsService;
    }

    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }

    public List<News> getNewss() {
        return newss;
    }

 public void setNewss(List<News> newss) {
     this.newss = newss;
 }
 
 public Integer getId() {
     return id;
 }
 
 public void setId(Integer id) {
     this.id = id;
 }
 
 public List<Note> getNotes() {
     return notes;
 }
 
 public void setNotes(List<Note> notes) {
     this.notes = notes;
 }
 }
