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
	<%@include file="/managers/top.jsp"%>
        <div id="page-wrapper">
			<div class="col-md-12 graphs">
				<div class="xs">
					<h3>报名列表</h3>
					<div class="panel panel-warning" data-widget="{&quot;draggable&quot;: &quot;false&quot;}" data-widget-static="">
						<div class="panel-body no-padding">
							<table class="table table-striped">
								<thead>

								<tr class="warning">
									<th>报名编码</th>
									<th>用户姓名</th>
									<th>课程名称</th>
									<th>报名结果</th>
									<th>操作</th>
								</tr>
								</thead>
								<tbody>
								<s:iterator  value="torders">
									<tr>
										<td>
											//value 就是 controller 传递给 view 的变量
											<pans><s:property value="id"/></pans>
										</td>
										<td>
											//span装载CSS信息的答容器，用来定义一专个由文本和HTML标签组成的属信息块。
											<span><s:property value="user.name"/></span>
										</td>
										<td>
											<span><s:property value="course.content"/></span>
										</td>
										<td>
											<span><s:property value="result"/></span>
										</td>
										<td>
											<c:if test="${result=='未通过'}">
											<button type="button" onclick="toupdate('<s:property value="id"/>')" class="label btn_lg label-primary" style="padding:8px 12px">审核</button>
											</c:if>
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


					<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h2 class="modal-title">审核</h2>
								</div>
								<div class="modal-body">
									是否审核通过？
									<input type="hidden" id="id" name="id"/>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger" onclick="doupdate()">确定</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>

								</div>
							</div><!-- /.modal-content -->
						</div><!-- /.modal-dialog -->
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
<script>

    function goPage(page){
        location="torder_list?pageBean.pageNo="+page;
    }


    function toupdate(id){
        $("#updateModal #id").val(id);
        $("#updateModal").modal("show");
    }

    function doupdate() {
        location.href="<%=Const.ROOT%>torder_doupdate?id="+ $("#updateModal #id").val();
    }


</script>
</body>
</html>
