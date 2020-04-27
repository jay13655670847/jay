package com.service;

import com.entity.News;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 53191 on 2019/1/11.
 */
public interface NewsService {
    public List<News> getAll(String hql, int page, int pageSize);

    public int getCount(String hql);

    public Serializable addNews(News news);

    public News getNewsById(Integer id);

    public void updateNews(News news);

    public void delById(Integer id);
}
