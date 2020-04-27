package com.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class BaseAction extends ActionSupport implements SessionAware, RequestAware, ServletRequestAware, ServletResponseAware {
    Map<String, Object> session;
    HttpServletRequest request;
    HttpServletResponse response;

    //设置request请求
    public void setRequest(Map<String, Object> reqeust) {
    
    }


​    
    //设置Session对象
    public void setSession(Map<String, Object> session) {
        this.session=session;
    }
    
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request=httpServletRequest;
    }

   

    public void setServletResponse(HttpServletResponse httpServletResponse) {
        //httpServletResponse.setContentType("application/json;charset=UTF-8");
        this.response=httpServletResponse;
    }
}
