<%@ page import="com.util.Const" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<doctype html!>
<html>
	<head>
		<title>Contact</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Play-Offs Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<meta charset utf="8">
		<!--fonts-->
		
        
		<!--fonts-->
		<!--link css-->
		<link rel="stylesheet" type="text/css" href="<%=Const.ROOT%>css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="<%=Const.ROOT%>css/demo.css" />
		<!--bootstrap-->
			<link href="<%=Const.ROOT%>css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<!--coustom css-->
			<link href="<%=Const.ROOT%>css/style.css" rel="stylesheet" type="text/css"/>
		<!--default-js-->
			<script src="<%=Const.ROOT%>js/jquery-2.1.4.min.js"></script>
		<!--bootstrap-js-->
			<script src="<%=Const.ROOT%>js/bootstrap.min.js"></script>
		<!--script-->
        <script src="<%=Const.ROOT%>js/jquery.circlechart.js"></script>
	</head>
    <body>
     <!--header-->
     <%@include file="/top.jsp"%>
    <!--header nav-->
        <div class="contact">
            <div class="container">
                <h3>个人信息修改</h3>
                <div class="contact-content">
                    <form method="post" action="<%=Const.ROOT%>user_update">
                        <input type="text" class="textbox" name="user.name" placeholder="姓名" value="<s:property value="#session.user.name"/>" required />
                        <select name="user.sex"  placeholder="性别" required value="<s:property value="#session.user.sex"/>" style=" border: none;border:2px solid #4aac5b;margin-top: 15px;width: 100%;padding: 10px;outline: none;font-weight: 100;font-family: sans-serif;color: #747779;">
                            <option  value="男">男</option>
                            <option  value="女">女</option>
                        </select>
                        <input type="text" class="textbox" name="user.phone" placeholder="电话"  value="<s:property value="#session.user.phone"/>" required />
                        <input type="text" class="textbox" name="user.height" placeholder="身高" value="<s:property value="#session.user.height"/>" required />
                        <input type="text" class="textbox" name="user.weight" placeholder="体重" value="<s:property value="#session.user.weight"/>" required />
                        <input type="text" class="textbox" name="user.age" placeholder="年龄"  value="<s:property value="#session.user.age"/>" required />
                        <input type="hidden" name="user.username" value="<s:property value="#session.user.username"/>">
                        <input type="hidden" name="user.password" value="<s:property value="#session.user.password"/>">
                        <input type="hidden" name="user.id" value="<s:property value="#session.user.id"/>">
                        <input type="hidden" name="user.ftime" value="<s:property value="#session.user.ftime "/>">
                        <input type="hidden" name="user.ltime" value="<s:property value="#session.user.ltime "/>">
                       <div class="submit"> 
                            <input class="btn btn-default cont-btn" type="submit" value="提交 " />
                      </div>
                    </form>
                </div>
            </div>
        </div>
    <!--footer-->
     <%@include file="/footer.jsp"%>
    </body>
</html>