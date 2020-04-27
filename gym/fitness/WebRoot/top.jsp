<%@ page import="com.util.Const" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="header-nav">
    <section class="color ss-style-bigtriangle nav-top">
        <nav class="navbar navbar-default">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="logo displ_stn">
                        <h1><a href="index.jsp">健身中心管理系统</a></h1>
                    </div>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav float-nav nav-algn_r">
                        <li><a href="<%=Const.ROOT%>coach_qlist" class="active">首页</a></li>
                        <li><a href="<%=Const.ROOT%>news_qlist">关于我们</a></li>
                    </ul>
                    <div class="logo float-nav nav-algn_c">
                        <h1><a href="<%=Const.ROOT%>coach_qlist">健身中心</a></h1>
                    </div>
                    <ul class="nav navbar-nav navbar-right float-nav nav-algn_l">
                        <li><a href="gallery.jsp">图片展示</a></li>
                        <c:if test="${not empty sessionScope.user}">
                        <li><a href="contact.jsp">个人管理</a></li>
                        </c:if>
                    </ul>
                    <div class="clearfix"></div>
                </div><!-- /.navbar-collapse -->
                <div class="clearfix"></div>
            </div><!-- /.container-fluid -->
        </nav>
    </section>
    <svg id="bigTriangleColor" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100" viewBox="0 0 100 102" preserveAspectRatio="none">
        <path d="M0 0 L50 100 L100 0 Z" />
    </svg>
</div>