<%@ page import="com.util.Const" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
	//显示窗口宽度是客户端的屏幕宽读（就是满屏）显示的文字知和图形的初始比例 是 1.0
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
	//jsp页面引入到当前页面中，在当前页面可以直接调用
	<%@include file="/managers/top.jsp"%>
        <div id="page-wrapper">
			<div class="col-md-12 graphs">
				<div class="xs">
					<h3>课程列表    <button type="button" class="btn-primary btn" onclick="add()">增加</button></h3>
					<div class="panel panel-warning" data-widget="{&quot;draggable&quot;: &quot;false&quot;}" data-widget-static="">
						<div class="panel-body no-padding">
							<table class="table table-striped">
								<thead>
								<tr class="warning">
									<th>课程编码</th>
									<th>课程内容</th>
									<th>课时</th>
									<th>价格</th>
									<th>教练</th>
									<th>操作</th>
								</tr>
								</thead>
								<tbody>
								<s:iterator  value="courses">
									<tr>
										<td>
											<span><s:property value="id"/></span>
										</td>
										<td>
											<span><s:property value="content"/></span>
										</td>
										<td>
											<span><s:property value="clazz"/></span>
										</td>
										<td>
											<span><s:property value="price "/></span>
										</td>
										<td>
											<span><s:property value="coach.name"/></span>
										</td>
										<td>
											<button type="button" onclick="toupdate('<s:property value="id"/>')" class="label btn_lg label-primary" style="padding:8px 12px">修改</button>
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

					<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h2 class="modal-title">课程添加</h2>
								</div>
								<div class="modal-body">
									<form  id="add" method="post" enctype="multipart/form-data" action="<%=Const.ROOT%>course_add"class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()">
										<fieldset>
											<div class="form-group">
												<label class="control-label">课程内容</label>
												<input type="text" class="form-control1 ng-invalid ng-invalid-required ng-touched" name="course.content" ng-model="model.content" required="">
											</div>
											<div class="form-group">
												<label class="control-label">课程价格</label>
												<input type="text" class="form-control1 ng-invalid ng-invalid-required ng-touched" name="course.price" ng-model="model.price" required="">
											</div>
											<div class="form-group">
												<label class="control-label">课程课时</label>
												<input type="text" class="form-control1 ng-invalid ng-invalid-required ng-touched" name="course.clazz " ng-model="model.clazz " required="">
											</div>
											<div class="form-group">
												<label class="control-label">课程教练</label>
												<select type="text"  class="form-control1 ng-invalid ng-invalid-required ng-touched" name="course.coach.id"  required>
													<s:iterator  value="coachs">
													<option value="<s:property value="id"/>"><s:property value="name"/></option>
													</s:iterator>
												</select>
											</div>
										</fieldset>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" onclick="doadd()">保存</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								</div>
							</div><!-- /.modal-content -->
						</div><!-- /.modal-dialog -->
					</div>

					<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h2 class="modal-title">课程修改</h2>
								</div>
								<div class="modal-body">
									<form id="update" method="post" enctype="multipart/form-data" action="<%=Const.ROOT%>course_doupdate" class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()">
										<input type="hidden" name="course.id" id="id"/>
										<fieldset>
											<div class="form-group">
												<label class="control-label">课程内容</label>
												<input type="text" id="content" class="form-control1 ng-invalid ng-invalid-required ng-touched" name="course.content" ng-model="model.content" required="">
											</div>
											<div class="form-group">
												<label class="control-label">课程价格</label>
												<input type="text" id="price" class="form-control1 ng-invalid ng-invalid-required ng-touched" name="course.price" ng-model="model.price" required="">
											</div>
											<div class="form-group">
												<label class="control-label">课程课时</label>
												<input type="text" id="clazz" class="form-control1 ng-invalid ng-invalid-required ng-touched" name="course.clazz " ng-model="model.clazz " required="">
											</div>
											<div class="form-group">
												<label class="control-label">课程教练</label>
												<select type="text"  id="coachid" class="form-control1 ng-invalid ng-invalid-required ng-touched" name="course.coach.id"  required>
													<s:iterator  value="coachs">
														<option value="<s:property value="id"/>"><s:property value="name"/></option>
													</s:iterator>
												</select>
											</div>
										</fieldset>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" onclick="doupdate()">保存</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								</div>
							</div><!-- /.modal-content -->
						</div><!-- /.modal-dialog -->
					</div>





					<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h2 class="modal-title">删除</h2>
								</div>
								<div class="modal-body">
									是否删除？
									<input type="hidden" id="uid"/>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger" onclick="dodelete()">确定</button>
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
        location="course_list?pageBean.pageNo="+page;
    }

    function add(){
        $("#addModal").modal("show");
    }
    function doadd(){
        $("#add").submit();
    }

    function toupdate(id){
        $.getJSON("<%=Const.ROOT%>coursejson_toupdate",{id:id},function(data){
            $("#updateModal #id").val(data.id);
            $("#updateModal #content").val(data.content);
            $("#updateModal #price").val(data.price);
            $("#updateModal #clazz").val(data.clazz);
            $("#updateModal #coachid").val(data.coach.id);
            $("#updateModal").modal("show");
        });
    }

    function doupdate() {
        $("#update").submit();
    }




    function todelete(id){
        $("#deleteModal #uid").val(id);
        $("#deleteModal").modal("show");
    }

    function dodelete(){
        var id=$("#deleteModal #uid").val();
        location="<%=Const.ROOT%>course_delete?id="+id;
    }
</script>
</body>
</html>
