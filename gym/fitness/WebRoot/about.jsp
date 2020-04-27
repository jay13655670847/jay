<%@ page import="com.util.Const" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<doctype html!>
<html>
	<head>
		<title>About</title>
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
        <link rel="stylesheet" href="<%=Const.ROOT%>css/buttons.css">
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
    <div class="about">
        <div class="container">
            <h3>关于我们</h3>
            <div class="about-grids">
                <div class="col-md-5 about-grid1">
                    <h4>器械介绍</h4>
                    <s:iterator  value="newss">
                    <c:if test="${type!='健身房'}">
                    <div class="history">
                        <div class="pull-left hist-icon">
                        <span class="glyphicon glyphicon-triangle-right hist-icn" aria-hidden="true"></span>
                        </div>
                        <div class="pull-right hist-text">
                            <s:property value="type"/>
                        <P><s:property value="content"/></P>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    </c:if>
                    </s:iterator>
                </div>
                <s:iterator  value="newss">
                    <c:if test="${type=='健身房'}">
                <div class="col-md-7 about-grid">
                <img src="images/ab1.jpg" class="img-responsive" alt="/">
                    <h4>健身房简介</h4>
                    <p><s:property value="content"/></p>
                </div>
                    </c:if>
                </s:iterator>
                <div class="clearfix"></div>
            </div>
        </div>    
    </div>
     <div class="nutrition">
         <div class="container">
             <h3>留言    <c:if test="${not empty sessionScope.user}"><button style="margin-left: 80%" class="button btn-success button-pill" onclick="addNote();">发表留言</button></c:if></h3>
             <div class="row">
                 <s:iterator  value="notes">
                 <div class="col-md-4 nutrn-grid" style="margin-top: 10px">
                     <div class="pull-left nutrn-text">
                         <h4>留言人：<s:property value="user.name"/></h4>
                         <p>留言内容：<s:property value="unote"/><br>
                            留言时间：<s:property value="utime"/><br>
                             <s:if test="anote!=null">
                            回复内容：<s:property value="anote"/><br>
                            回复时间: <s:property value="atime"/>
                             </s:if>
                             <s:else>感谢你的留言<br>
                                 等待回复中......</s:else>
                         </p>
                     </div>
                     <div class="pull-right nutrn-icn">
                         <span class="glyphicon glyphicon-heart nutrn-icon" aria-hidden="true"></span>
                     </div>
                     <div class="clearfix"></div>
                 </div><!-- /.col-lg-4 -->
                 </s:iterator>
             </div><!-- /.row -->
             <link rel="stylesheet" type="text/css" href="<%=Const.ROOT%>css/magnific-popup.css">

         </div>
     </div>

     <div class="modal fade" id="addNote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title" >留言</h4>
                 </div>
                 <div class="col-md-12" >
                     <form id="Note" action="<%=Const.ROOT%>note_add" method="post">
                         <input type="hidden"  name="id" value="<s:property value="#session.user.id"/>">
                         <input type="text" class="textbox" name="note.unote" placeholder="留言" required />
                     </form>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary" onclick="doaddNote()">发表</button>
                     <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                 </div>
             </div><!-- /.modal-content -->
         </div><!-- /.modal -->
     </div>

     <script>
         function addNote(){
             $("#addNote").modal("show");
         }

         function doaddNote(){
             $("#Note").submit();
         }
     </script>
    <!--footer-->
     <%@include file="/footer.jsp"%>
    </body>
</html>