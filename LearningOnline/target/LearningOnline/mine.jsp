<%--
  Created by IntelliJ IDEA.
  User: 13470
  Date: 2020/4/12
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/getParameter.js"></script>

    <style>
        #username{
            margin-left: 12px;
        }

        #btn{
            background-color: #d9534f;
        }
    </style>

    <script>
        // 入口函数
        $(function () {
            // 页面加载完成调用数据库查询个人信息
            var id = getParameter("id");
            $.post("mineController/findUser",{"id":id},function (data) {
                $("#username").prop("value",data.user.username);
                $("#name").prop("value",data.user.name);
                $("#phone").prop("value",data.user.phone);
                var sex=data.user.gender;
                if(sex=="男"){
                    $("#male").prop("checked","checked");
                }else {
                    $("#female").prop("checked","checked");
                }

            });
        });

        $(function () {
            $("#btn").click(function () {
                $.post("mineController/updateUser",$("#form").serialize(),function (data) {
                    if(data.flag){
                        alert(data.msg);
                    }else {
                        alert(data.msg);
                    }
                });
            });
        });

        function exit() {
            $.post("mineController/exitLogin",{},function (data) {
                location.href="http://localhost:8080/LearningOnline/login.jsp";
            });
        }

    </script>
</head>
<body>

<div>
    <!--    头部信息-->
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
                        <li class="dropdown">
                            <img src="images/header.jpg" style="width: 50px;height: 50px;margin-right: 20px"  class="img-circle">
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>

    <!--    菜单栏-->
    <div style="float:left;">
        <ul class="nav nav-pills nav-stacked" style="margin-left: 200px">
            <li role="presentation"  style="font-size: 20px;width: 200px"><a href="index.jsp">首页</a></li>
            <li role="presentation" class="active"  style="font-size: 20px;width: 200px"><a href="#">个人信息</a></li>
            <li role="presentation"  style="font-size: 20px;width: 200px"><a href="favoriteCourse.jsp">收藏课程</a></li>
            <li role="presentation"  style="font-size: 20px;width: 200px"><a href="videoUpload.jsp">上传视频</a></li>
            <li role="presentation"  style="font-size: 20px;width: 200px"><a href="changePassword.jsp">修改密码</a></li>
            <li role="presentation"  style="font-size: 20px;width: 200px"><a onclick="exit()" href="#">退出登录</a></li>
        </ul>
    </div>

    <div style="float:right;margin-right: 930px;margin-top: 20px">
        <div>
            <p style="font-size: 18px">个人信息</p>
        </div>

        <div>
            <img src="images/header.jpg" style="width: 100px;height: 100px">
        </div>

        <div style="padding-top: 10px">
            <button type="button" class="btn btn-info">更换头像</button>
        </div>

    </div>

    <div >
        <form class="form-inline" id="form" style="margin-top: 250px;margin-left: 500px">
            <div class="form-group">
                <label for="username">用户名</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="">
            </div><br>
            <div class="form-group" style="padding-top: 20px">
                <label for="name">真实姓名</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="">
            </div><br>
            <div class="form-group" style="padding-top: 20px">
                <label >性  别</label><br>
                <input type="radio" class="form-control" id="male"  name="gender" value="男" >男
                <input type="radio" class="form-control" id="female"  name="gender" value="女" style="margin-left: 15px">女
            </div><br>
            <div class="form-group" style="padding-top: 20px">
                <label for="phone">联系方式</label>
                <input type="tel" class="form-control" id="phone" name="phone" placeholder="">
            </div><br>
            <div class="form-group" style="padding-top: 20px">
                <button type="button" id="btn" class="btn btn-info">保存修改</button>
            </div>
        </form>
    </div>


</div>



</body>
</html>
