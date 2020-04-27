<%@ page import="com.util.Const" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="<%=Const.ROOT%>managers/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="<%=Const.ROOT%>managers/css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="<%=Const.ROOT%>managers/css/lines.css" rel='stylesheet' type='text/css' />
<link href="<%=Const.ROOT%>managers/css/font-awesome.css" rel="stylesheet">
<!-- jQuery -->
<script src="<%=Const.ROOT%>managers/js/jquery.min.js"></script>
<!-- Nav CSS -->
<link href="<%=Const.ROOT%>managers/css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=Const.ROOT%>managers/js/metisMenu.min.js"></script>
<script src="<%=Const.ROOT%>managers/js/custom.js"></script>
<!-- Graph JavaScript -->
<script src="<%=Const.ROOT%>managers/js/d3.v3.js"></script>
<script src="<%=Const.ROOT%>managers/js/rickshaw.js"></script>
	<script src="<%=Const.ROOT%>managers/js/bootstrap.min.js"></script>
</head>
<body>
<div id="wrapper">

     <!-- Navigation -->
	//把top.jsp原封不动引用到user.jsp中
	<%@include file="/managers/top.jsp"%>
        <div id="page-wrapper">
			<div class="col-md-12 graphs">
				<div class="xs">
					<h3>用户列表</h3>
					<div class="tab-pane active" id="horizontal-form">
						<%--<form class="form-horizontal" id="myForm" method="post" action="${pageContext.request.contextPath }/user_list">--%>
							<%--<input type="hidden" name="pageNO" id="pageNo" value="<s:property value="pageBean.pageNo"/>"/>--%>

						<%--</form>--%>
					</div>
					<div class="panel panel-warning" data-widget="{&quot;draggable&quot;: &quot;false&quot;}" data-widget-static="">
						<div class="panel-body no-padding">
							<table class="table table-striped">
								<thead>
								<tr class="warning">
									<th>用户编码</th>
									<th>姓名</th>
									<th>性别</th>
									<th>身高</th>
									<th>体重</th>
									<th>电话</th>
									<th>办卡时间</th>
									<th>到期时间</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
								</thead>
								<tbody>
                                <s:iterator  value="users">
									<tr>
										<td>
											<span><s:property value="id"/></span>
										</td>
										<td>
											<span><s:property value="name"/></span>
										</td>
										<td>
											<span><s:property value="sex"/></span>
										</td>
										<td>
											<span><s:property value="height"/>cm</span>
										</td>
										<td>
											<span><s:property value="weight"/>kg</span>
										</td>
										<td>
											<span><s:property value="phone"/></span>
										</td>
										<td>
											<span><s:property value="ftime"/></span>
										</td>
										<td>
											<span><s:property value="ltime"/></span>
										</td>
										<td>
											<s:if test="daoqi"><span style="color: red">已到期</span></s:if>
											<s:else><span>正常</span></s:else>
										</td>
										<td>
											<button type="button" onclick="todelete('<s:property value="id"/>')"  class="label btn_lg label-danger" style="padding:8px 12px">删除</button>
										</td>
									</tr>
								</s:iterator>
								</tbody>
							</table>
							<nav>
								<ul class="pagination">
									<li><a href="javascript:goPage('<s:property value="pageBean.prePage"/>')" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li>
									<li><a href="javascript:goPage('<s:property value="pageBean.nextPage"/>')" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>
								</ul>
							</nav>
						</div>
					</div>


				</div>
				<div class="copy_layout">
					<p>Copyright &copy; 2020.</p>
				</div>
			</div>

		</div>
      <!-- /#page-wrapper -->

	<!-- Navigation -->

	<!-- /#page-wrapper -->

</div>
    <!-- /#wrapper -->
    <!-- Bootstrap Core JavaScript -->

<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h2 class="modal-title">删除</h2>
			</div>
			<div class="modal-body">
				是否删除？
				<input type="hidden" name="news.id" id="uid" value=""/>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" onclick="dodelete()">确定</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>
<script>

    function goPage(page){
        location="user_list?pageBean.pageNo="+page;
    }
    function todelete(id){
        $("#deleteModal #uid").val(id);
        $("#deleteModal").modal("show");
    }

    function dodelete(){
        var id=$("#deleteModal #uid").val();
        location="<%=Const.ROOT%>user_delete?id="+id;
    }

</script>
</body>
</html>
