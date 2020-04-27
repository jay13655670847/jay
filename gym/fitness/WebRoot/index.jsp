<%@ page import="com.util.Const" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<doctype html!>
<html lang="zh">
	<head>
		<title>Home</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Play-Offs Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<meta charset utf="8">
		<!--fonts-->

		<!--fonts-->
		<!--link css-->
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
        <script type="text/JavaScript" src="<%=Const.ROOT%>My97DatePicker/WdatePicker.js"></script>
    </head>
    <body>
        <div class="header-top">
            <%@include file="/top.jsp"%>
                <!--header-text-->
                <div class="head-top-text">
                    <div class="container">
                        <h2>健身中心</h2>
                        <p>欢迎来到健身中心！<br> 您在这里一定能享受到最完美的健身体验！ </p>
                        <c:if test="${empty sessionScope.user}">
                        <a class="btn btn-default hd-more" href="javascript:void(0)" role="button" onclick="login()">登录</a> <a class="btn btn-default hd-more" href="javascript:void(0)" role="button" onclick="add()">注册</a>
                        </c:if>
                        <c:if test="${not empty sessionScope.user}">
                        <a class="btn btn-default hd-more" href="javascript:void(0);">欢迎你，<s:property value="#session.user.name"/></a>
                        <a class="btn btn-default hd-more" href="<%=Const.ROOT%>user_logout">退出</a>
                        </c:if>
                    </div>
                </div>
            </div>

        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">注册</h4>
                    </div>
                    <div class="col-md-12" >
                        <form id="add" action="<%=Const.ROOT%>user_add" method="post">
                            <input type="text" class="textbox" name="user.username" placeholder="帐号" required />
                            <input type="password" class="textbox" name="user.password" placeholder="密码" required maxlength="6"/>
                            <input type="text" class="textbox" name="user.name" placeholder="姓名" required />
                            <select name="user.sex"  placeholder="性别" required style=" border: none;border:2px solid #4aac5b;margin-top: 15px;width: 100%;padding: 10px;outline: none;font-weight: 100;font-family: sans-serif;color: #747779;">
                                <option  value="男">男</option>
                                <option  value="女">女</option>
                            </select>
                            <input type="text" class="textbox" name="user.phone" placeholder="电话" required maxlength="11"/>
                            <input type="text" class="textbox" name="user.height" placeholder="身高(cm)" required />
                            <input type="text" class="textbox" name="user.weight" placeholder="体重(kg)" required />
                            <input type="text" class="textbox" name="user.age" placeholder="年龄" required />
                            <input name="user.ltime" class="Wdate textbox" placeholder="到期时间" onfocus="WdatePicker({readOnly:true,minDate:'%y-%M-%d'})" /><br><br>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="doadd()">注册</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" >登录</h4>
                    </div>
                    <div class="col-md-12" >
                        <form id="login" action="<%=Const.ROOT%>user_login" method="post">
                            <input type="text" class="textbox" name="user.username" placeholder="帐号" required />
                            <input type="password" class="textbox" name="user.password" placeholder="密码" required />
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="dologin()">登录</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

        <script>
            function add(){
                $("#addModal").modal("show");
            }
            function doadd(){
                $("#add").submit();
            }

            function login(){
                $("#loginModal").modal("show");
            }
            function dologin(){
                $("#login").submit();
            }
        </script>


         <!--trainers-->
        <div class="our-trainers">
            <div class="container" id="coachlist">
             </div>
        </div>



        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h2 class="modal-title">评价</h2>
                    </div>
                    <div class="modal-body" id="content-pingjia">

                    </div>
                    <div class="modal-footer">

                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>

        <div class="modal fade" id="addCom" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" >发表评价</h4>
                    </div>
                    <div class="col-md-12" >
                        <form id="comment" action="<%=Const.ROOT%>comment_add" method="post">
                            <input type="hidden" id="cid" name="id">
                            <input type="text" class="textbox" name="comment.content" placeholder="评价" required />
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="doaddcom()">发表</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
<script>

    function goPage(page){
        $.get("<%=Const.ROOT%>coach_qjsonlist",{"pageBean.pageNo":page},function(result){
            $("#coachlist").html(result);
        });
    }


    function todelete(id){
        $.getJSON("<%=Const.ROOT%>comment_listById",{id:id},function(data){
            $("#content-pingjia").html("");
            $(data).each(function (index, comment) {
                $("#content-pingjia").append("<p style='font-size: 21px;'><span id=\"cid\"></span>"+(index+1)+".<span id=\"content\">"+comment.content+"</span></p>");
            });
            $("#deleteModal").modal("show");
        });
    }

    function addcom(id){
        $("#addCom #cid").val(id);
        $("#addCom").modal("show");
    }
    function doaddcom(){
        $("#comment").submit();
    }
    $(function () {
        goPage(1);
    });
</script>

        <div class="stats-tabs">
            <div class="container">
                <h3>简介</h3>
                <div class="col-md-12 pd tabs">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs nav2" role="tablist">
                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">肌肉</a></li>
                    <li role="presentation" ><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">骨骼</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">

                    <div role="tabpanel" class="tab-pane active re-pad2" id="home">
                        <div class="col-md-4 re-flt">
                            <img src="./images/tb1.jpg" alt="/" class="img-responsive">
                        </div>
                        <div class="col-md-2 re-flt re-xt">
                            <ul>
                                <s:iterator  value="muscles" status="status">
                                <li onclick="xianshi(<s:property value="#status.count"/>)"><h4><s:property value="title"/></h4></li>
                                </s:iterator>
                            </ul>
                        </div>
                        <div class="col-md-6 re-flt re-xt">
                            <ul id="xianshi">
                                <s:iterator  value="muscles" status="status">
                                        <s:if test="#status.count==1">
                                            <li style="list-style:none"><p><s:property value="content"/></p></li>
                                        </s:if>
                                        <s:if test="#status.count!=1">
                                            <li style="display: none;list-style:none"><p><s:property value="content"/></p></li>
                                        </s:if>
                                </s:iterator>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div role="tabpanel" class="tab-pane re-pad2" id="profile">
                        <div class="col-md-4 re-flt">
                            <img src="./images/tb3.jpg" alt="/" class="img-responsive">
                        </div>
                        <div class="col-md-2 re-flt re-xt">
                            <ul>
                                <s:iterator  value="muscles2" status="status">
                                    <li onclick="xianshi2(<s:property value="#status.count"/>)"><h4><s:property value="title"/></h4></li>
                                </s:iterator>
                            </ul>
                        </div>
                        <div class="col-md-6 re-flt re-xt">
                            <ul id="xianshi2">
                                <s:iterator  value="muscles2" status="status">
                                    <s:if test="#status.count==1">
                                        <li style="list-style:none"><p><s:property value="content"/></p></li>
                                    </s:if>
                                    <s:if test="#status.count!=1">
                                        <li style="display: none;list-style:none"><p><s:property value="content"/></p></li>
                                    </s:if>
                                </s:iterator>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

        <script>
            function xianshi(id) {
                $("#xianshi li").hide();
                $($("#xianshi li").get(id-1)).show();
            }
            function xianshi2(id) {
                $("#xianshi2 li").hide();
                $($("#xianshi2 li").get(id-1)).show();
            }
        </script>

        <div class="nutrition">
            <div class="container">
                <h3>课程</h3>
                <div class="row">
                    <s:iterator  value="courses">
                    <div class="col-md-4 nutrn-grid" style="margin-top: 10px">
                        <div class="pull-left nutrn-text">
                            <h4><s:property value="content"/></h4>
                            <p>课时：<s:property value="clazz"/><br>价格：￥<s:property value="price "/><br>教练：<s:property value="coach.name"/>
                            <c:if test="${not empty sessionScope.user}">
                                <br>已预约人数：<s:property value="sum"/>
                                </c:if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <s:if test="jieguo==0"><s:if test="sum<30"><button class="btn btn-success btn-xs"  onclick="addorder('<s:property value="id"/>')" >预定课程</button></s:if></s:if>
                               <s:if test="jieguo==1"><button class="btn btn-danger btn-xs">等待审核</button></s:if>
                               <s:if test="jieguo==2"><button class="btn btn-info btn-xs">审核通过</button></s:if>
                            </p>
                        </div>

                        <div class="clearfix"></div>
                    </div><!-- /.col-lg-4 -->
                    </s:iterator>
                    <div class="clearfix"></div>
                </div><!-- /.row -->
                <link rel="stylesheet" type="text/css" href="<%=Const.ROOT%>css/magnific-popup.css">
            </div>
        </div>


        <div class="modal fade" id="addtorder" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h2 class="modal-title">预定课程</h2>
                    </div>
                    <div class="modal-body">
                        是否预定课程？
                        <form action="<%=Const.ROOT%>torder_add" id="order">
                        <input type="hidden" id="uid" name="uid"/>
                        <input type="hidden" id="id" name="id" value="<s:property value="#session.user.id"/>"/>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" onclick="doorder()">确定</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>

<script>
    function addorder(id){
        $("#addtorder #uid").val(id);
        $("#addtorder").modal("show");
    }

    function doorder(){
        $("#order").submit();
    }
</script>


        <%@include file="/footer.jsp"%>
    </body>
</html>