<%--
  Created by IntelliJ IDEA.
  User: 13470
  Date: 2020/4/13
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>视频上传</title>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/getParameter.js"></script>
    <script src="js/jquery.fileupload.js"></script>

    <script>
        function exit() {
            $.post("mineController/exitLogin",{},function (data) {
                location.href="http://localhost:8080/LearningOnline/login.jsp";
            });
        }

        $(function () {
            // var formData = new FormData($("#form")[0]);

            // var formData =new FormData();
            // formData.append("upload",document.getElementById("upload").files[0]);

            $("#submit").click(function (e) {

                e.preventDefault()
                alert("click");
                $.ajax({
                   url:"mineController/videoUpload",
                   type:"post",
                   data:new FormData($("#form")[0]),
                    cache: false,//上传文件不需要缓存
                    processData:false,/**
                     *必须false才会自动加上正确的Content-Type
                     */
                   contentType:false,/**
                     * 必须false才会避开jQuery对 formdata 的默认处理
                     * XMLHttpRequest会对 formdata 进行正确的处理
                     */
                   dataType:"json",
                   success:function (data) {
                       if(data.flag){
                           alert(data.msg);
                       }else {
                           alert(data.msg);
                       }
                   } ,
                    error:function (data) {
                        alert("error");
                    }

               });

            });
        });

    </script>
</head>
<body style="font-size: 18px">
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
            <li role="presentation" class=""  style="font-size: 20px;width: 200px"><a href="#">个人信息</a></li>
            <li role="presentation"  style="font-size: 20px;width: 200px"><a href="favoriteCourse.jsp">收藏课程</a></li>
            <li role="presentation"  class="active"  style="font-size: 20px;width: 200px"><a href="videoUpload.jsp">上传视频</a></li>
            <li role="presentation"  style="font-size: 20px;width: 200px"><a href="changePassword.jsp">修改密码</a></li>
            <li role="presentation"  style="font-size: 20px;width: 200px"><a onclick="exit()" href="#">退出登录</a></li>
        </ul>
    </div>

    <div style="float:right;margin-right: 960px;margin-top: 20px">
        <div>
            <p>上传视频</p>
        </div>

    </div>

    <div >
        <form  class="form-inline" enctype="multipart/form-data" id="form" style="margin-top: 150px;margin-left: 500px">

            <div>
                <label>选择视频</label>
                <input type="file" name="upload" id="upload" accept="video/mp4">
            </div><br>

            <div style="padding-top: 20px">
                <input type="submit" id="submit"  value="上传视频" style="background-color: #2aabd2">
            </div>
        </form>
    </div>


</div>
</body>
</html>
