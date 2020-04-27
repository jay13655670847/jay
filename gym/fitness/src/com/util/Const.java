package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

//const限定一个变量不允许被改变，产生静态作用
public class Const {
   //根节点
    public static final String ROOT="/fitness/";
//得到一个时间
    public static String getCurrentTime(){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	return sdf.format(new Date());
    }
    
    public static String getCurrentDay(){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    	return sdf.format(new Date());
    }
    public static String getFileId(){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
    	return sdf.format(new Date());
    }
}
