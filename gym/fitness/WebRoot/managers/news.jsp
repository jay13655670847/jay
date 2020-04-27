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
					<h3>介绍列表  <button type="button" class="btn-primary btn" onclick="add()">增加</button></h3>

					<div class="panel panel-warning" data-widget="{&quot;draggable&quot;: &quot;false&quot;}" data-widget-static="">
						<div class="panel-body no-padding">
							<table class="table table-striped">
								<thead>

								<tr class="warning">
									<th>介绍编码</th>
									<th>介绍类型</th>
									<th>介绍内容</th>
									<th>操作</th>
								</tr>
								</thead>
								<tbody>
								<s:iterator  value="newss">
									<tr>
										<td>
											<span><s:property value="id"/></span>
										</td>
										<td>
											<span><s:property value="type"/></span>
										</td>
										<td>
											<span><s:property value="content"/></span>
										</td>
										<td>
											<button type="button" onclick="toupdate('<s:property value="id"/>')" class="label btn_lg label-primary" style="padding:8px 12px">修改</button>
											<c:if test="${type!='健身房'}">
											<button type="button" onclick="todelete('<s:property value="id"/>')"  class="label btn_lg label-danger" style="padding:8px 12px">删除</button>
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

					<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h2 class="modal-title">器械添加</h2>
								</div>
								<div class="modal-body">
									<form  id="add" method="post" enctype="multipart/form-data" action="<%=Const.ROOT%>news_add"class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()">
										<fieldset>
											<div class="form-group">
												<label class="control-label">器械种类</label>
												<input type="text" class="form-control1 ng-invalid ng-invalid-required ng-touched" name="news.type" ng-model="model.type" required="">
											</div>
											<div class="form-group">
												<label class="control-label">器械介绍</label>
												<textarea style="height: 100px" class="form-control1 ng-invalid ng-invalid-required ng-touched" name="news.content" ng-model="model.content" required=""></textarea>
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
									<h2 class="modal-title">器械修改</h2>
								</div>
								<div class="modal-body">
									<form id="update" method="post" enctype="multipart/form-data" action="<%=Const.ROOT%>news_doupdate" class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()">
										<input type="hidden" name="news.id" id="id"/>
										<fieldset>
											<div class="form-group">
												<label class="control-label">器械种类</label>
												<input type="text" id="type" class="form-control1 ng-invalid ng-invalid-required ng-touched" name="news.type" ng-model="model.type" required="">
											</div>
											<div class="form-group">
												<label class="control-label">器械介绍</label>
												<textarea style="height: 100px"  id="content" class="form-control1 ng-invalid ng-invalid-required ng-touched" name="news.content" ng-model="model.content" required=""></textarea>
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
									<input type="hidden" name="news.id" id="uid" value=""/>
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
        location="news_list?pageBean.pageNo="+page;
    }

    function add(){
        $("#addModal").modal("show");
    }
    function doadd(){
        $("#add").submit();
    }

    function toupdate(id){
        $.getJSON("<%=Const.ROOT%>newsjson_toupdate",{id:id},function(data){
            $("#updateModal #id").val(data.id);
            $("#updateModal #type").val(data.type);
            $("#updateModal #content").val(data.content);
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
        location="<%=Const.ROOT%>news_delete?id="+id;
    }
</script>
</body>
</html>
