<%@ page import="com.util.Const" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="<%=Const.ROOT%>managers/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="<%=Const.ROOT%>managers/css/style.css" rel='stylesheet' type='text/css' />
<link href="<%=Const.ROOT%>managers/css/font-awesome.css" rel="stylesheet">
<!-- jQuery -->
<script src="<%=Const.ROOT%>managers/js/jquery.min.js"></script> 
<!-- Bootstrap Core JavaScript -->
<script src="<%=Const.ROOT%>managers/js/bootstrap.min.js"></script>
</head>
<body id="login">
  <div class="login-logo">
    <a href="index.jsp"></a>
  </div>
  <h2 class="form-heading">健身中心系统后台登录</h2>
  <div class="app-cam">
	  <form action="<%=Const.ROOT%>admin_login" method="post">
		<input type="text" class="text"  id="username" name="admin.username" placeholder="请输入用户名" required />
		<input type="password" id="password" name="admin.password" placeholder="请输入密码" required/>
		<div class="submit"><input type="submit" onclick="myFunction()" value="登录"></div>
		<div class="login-social-link">

        </div>
		<ul class="new">
			<li class="new_left"><p></p></li>
			<li class="new_right"><p class="sign"></p></li>
			<div class="clearfix"></div>
		</ul>
	</form>
  </div>
   <div class="copy_layout login">
      </div>
</body>
</html>
