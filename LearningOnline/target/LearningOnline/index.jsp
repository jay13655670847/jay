<%--
  Created by IntelliJ IDEA.
  User: 13470
  Date: 2020/4/7
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js "></script>

    <style>
        #icon{
            margin-top: 40px;
            margin-left: 20px;
        }

        .td{
            width: 300px;
            height: 200px;
            padding-left: 20px;
            padding-top: 15px;
        }

        #table{
            margin: auto;
        }

        #footer{
            padding-top: 20px;
        }
    </style>

    <script>
        // 入口函数
        $(function () {
            // 轮播图点击事件
            $("#lunbo1").click(function () {
                location.href="course.jsp";
            });

            $("#lunbo2").click(function () {
                location.href="";
            });

            $("#lunbo3").click(function () {
                location.href="";
            });

            //搜索
            $("#search-btn").click(function () {
                var search = $("#search-input").val();
                if(search){
                    search=window.decodeURIComponent(search);
                }
                location.href="http://localhost:8080/LearningOnline/course.jsp?search="+search+"";
            });

        });

        $(function () {
            // 头像点击事件
            $("#head").click(function () {
                $.post("loginUserController/isLogin",$(this).serialize(),function (data) {
                    if(data.flag){
                        //登录成功
                        var id=data.user.id;
                        location.href="http://localhost:8080/LearningOnline/mine.jsp?id="+id+"";
                    }else {
                        //未登录。跳转登录页面
                        location.href="http://localhost:8080/LearningOnline/login.jsp";
                    }
                });
            });
        });


        //课程
        $(function () {
            $.post("courseController/findMaxCourse",{},function (data) {
                var lis="";
                for (var x=0;x<3;x++){
                    var li=" <td class='td' '>\n" +
                        "                <a href='http://localhost:8080/LearningOnline/video.jsp?video="+data[x].video+"&img="+data[x].img+"&id="+data[x].id+"&counts="+data[x].counts+"'><img src=\""+data[x].img+"\" alt=\"\" height=\"100%\"></a>\n" +
                        "                <p>"+data[x].name+"</p>\n" +
                        "                <font color=\"gray\" size=\"2\">已有"+data[x].counts+"人观看</font>\n" +
                        "            </td>";

                    lis+=li;
                }
                $("#tr1").html(lis);

                var lis2="";
                for(var x=3;x<6;x++){
                    var li=" <td class='td'>\n" +
                        "<a href='http://localhost:8080/LearningOnline/video.jsp?video="+data[x].video+"&img="+data[x].img+"&id="+data[x].id+"&counts="+data[x].counts+"'><img src=\""+data[x].img+"\" alt=\"\" height=\"100%\"></a>\n" +
                        "                <p>"+data[x].name+"</p>\n" +
                        "                <font color=\"gray\" size=\"2\">已有"+data[x].counts+"人观看</font>\n" +
                        "            </td>";

                    lis2+=li;
                }
                $("#tr2").html(lis2);
            });
        });
    </script>
</head>
<body>

<%--头部信息--%>
<div>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <!-- 定义汉堡按钮 -->
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a  class="navbar-brand" href="#"><img src="images/logo.jpg" style="width: 65px;height: 65px;margin-top: -22px"></a>
            <a class="navbar-brand" style="padding-left: 40px" href="index.jsp">首页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li  style="padding-left: 30px"><a href="course.jsp">课程 <span class="sr-only">(current)</span></a></li>
                <li style="padding-left: 30px"><a href="section.jsp">章节学习</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li style="width: 600px;padding-top: 7px"> <div class="col-lg-6">
                    <div class="input-group">
                        <input type="text" class="form-control" id="search-input">
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button" id="search-btn">搜索</button>
                        </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 --></li>
                <li class="dropdown">
                    <img src="images/header.jpg" id="head" style="width: 50px;height: 50px;margin-right: 20px"  class="img-circle">
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
</div>

<%--轮播图--%>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="2000" style="height: 310px;width: 550px;margin: auto">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img id="lunbo1" src="images/lunbo1.jpg" alt="">
        </div>
        <div class="item">
            <img id="lunbo2" src="images/lunbo2.jpg" alt="">
        </div>
        <div class="item">
            <img id="lunbo3" src="images/lunbo3.jpg" alt="">
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<%--课程信息--%>
<div>
    <div id="icon"><font size="6px">免费好课</font></div>

    <table id="table">
        <tr id="tr1">

        </tr>
        <tr id="tr2">

        </tr>
    </table>
</div>

<footer>
    <div id="footer">
        <font color="gray" size="2">
            <center>
                计算机组成原理在线学习平台<br>
            </center>
        </font>
    </div>
</footer>
</body>
</html>
