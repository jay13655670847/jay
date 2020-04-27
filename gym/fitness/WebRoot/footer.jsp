<%@ page import="com.util.Const" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="footer">
    <div class="container">
        <div class="col-md-4 ft logo">
            <div class="logo fot">
                <h1><a href="<%=Const.ROOT%>coach_qlist" class="ft-log">健身中心管理系统</a></h1>
            </div>
        </div>
        <div class="col-md-4 ft cpyrt">
            <p>Copyright &copy; 2020</p>
        </div>
        <div  class="col-md-4 ft cpyrt">
            <p><a href="<%=Const.ROOT%>managers/login.jsp" target="_blank">后台登录</a></p>
        </div>
        <div class="clearfix"></div>
    </div>
</div>