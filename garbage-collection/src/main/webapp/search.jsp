<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
           + request.getServerName() + ":" + request.getServerPort()
           + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>垃圾分类查询</title>
<script type="text/javascript" src="<%=basePath %>/js/jquery.min.js"></script>

</head>
<body>
<h3>垃圾识别</h3>

	<input type="text" id="kw" name="kw" />
	<input type="button" id="submit" value="查询">
	<br/>
	<div>
		垃圾名称：<b id="name" style="color: red"></b><br/>
		类型：<b id="type"  style="color: red"></b><br/>
		备注：<b id="remark"  style="color: red"></b><br/>
	</div>
	
	<hr/>


<script>
	$(document).ready(function(){
	  $("#submit").click(function(){
	  	 $.post("distinguish/search",{"kw":$("#kw").val()},function (info) {
				if (info.code==200){
					alert(info);
					$("#name").html(info.name);
					$("#type").html(info.data);
				}else{
					alert("请求失败！");
					console.log(e.status);
					console.log(e.responseText);
				}
		 });

	  });
	});
</script>
</body>
</html>