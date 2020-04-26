package cn.itcast.service;

import cn.itcast.domain.FavoriteCourse;
import cn.itcast.domain.Message;

import java.util.List;

public interface FavoriteCourseService {

    Message favoriteCourse(int id,int uid);

    List<FavoriteCourse> findAllCourse(int uid);

    Message checkFavorite(int cid,int uid);
}
