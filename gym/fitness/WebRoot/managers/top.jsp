<%@ page import="com.util.Const" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="javascript:void(0);">健身中心系统后台</a>
    </div>
    <!-- /.navbar-header -->
    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <a href="<%=Const.ROOT%>admin_list"><span class="glyphicon glyphicon-cog"></span><i class="fa nav_icon"></i>管理员管理</a>
                </li>
                <li>
                    <a href="<%=Const.ROOT%>user_list"><span class="glyphicon glyphicon-user"></span><i class="fa  nav_icon"></i>用户管理</a>

                </li>
                <li>
                    <a href="<%=Const.ROOT%>coach_list"><span class="glyphicon glyphicon-th-large"></span><i class="fa  nav_icon"></i>教练管理</a>

                </li>
                <li>
                    <a href="<%=Const.ROOT%>news_list"><span class="glyphicon glyphicon-th"></span><i class="fa  nav_icon"></i>介绍管理</a>
                </li>
                <li>
                    <a href="<%=Const.ROOT%>course_list"><span class="glyphicon glyphicon-th-list"></span><i class="fa  nav_icon"></i>课程管理</a>
                </li>
                <li>
                    <a href="<%=Const.ROOT%>torder_list"><span class="glyphicon glyphicon-globe"></span><i class="fa  nav_icon"></i>报名管理</a>
                </li>
                <li>
                    <a href="<%=Const.ROOT%>note_list"><span class="glyphicon glyphicon-comment"></span><i class="fa nav_icon"></i>留言管理</a>
                </li>
                <li>
                    <a href="<%=Const.ROOT%>muscle_list"><span class="glyphicon glyphicon-tasks"></span><i class="fa  nav_icon"></i>简介管理</a>
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>
