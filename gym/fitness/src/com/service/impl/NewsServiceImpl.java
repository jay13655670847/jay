package com.service.impl;

import com.dao.GenericDao;
import com.entity.News;
import com.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/11.
 */
@Service
public class NewsServiceImpl implements NewsService{

    @Autowired
    private GenericDao<News> newsDao;


  
    public List<News> getAll(String hql, int page, int pageSize) {
        return newsDao.getByPage(hql,page,pageSize);
    }

  
    public int getCount(String hql) {
        return newsDao.getCount(hql);
    }

  
    public Serializable addNews(News news) {
        return newsDao.add(news);
    }

 
    public News getNewsById(Integer id) {
        return newsDao.get(News.class,id);
    }

 
    public void updateNews(News news) {
        newsDao.update(news);
    }

 
    public void delById(Integer id) {
        newsDao.delete(getNewsById(id));
    }


}
