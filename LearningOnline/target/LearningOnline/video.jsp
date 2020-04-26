<%--
  Created by IntelliJ IDEA.
  User: 13470
  Date: 2020/4/10
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>视频播放</title>

    <link rel="stylesheet" href="css/DPlayer.min.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js "></script>

    <script src="js/getParameter.js"></script>
    <!--导入布局js，共享header和footer-->
    <script type="text/javascript" src="js/include.js"></script>

    <style>
    #dplayer {
        width: 860px;
        height: 500px;
        margin: auto;
        margin-left: 300px;
        margin-top: 80px;
        float: left;
    }
</style>

    <script>
        var id=getParameter("id");
        $(function () {
            $.post("favoriteCourseController/checkFavorite",{id:id},function (data) {
                if(data.flag){
                }else{
                    $("#btn").prop("disabled","disabled");
                }
            });
        });

        // 入口函数
        $(function () {
            var videoUrl = getParameter("video");
            var img=getParameter("img");

            var counts=parseInt(getParameter("counts"));
            counts=counts+1;
            dp.switchVideo({
                url: ''+videoUrl+'',
                pic: ''+img+'',
                thumbnails: '',
                type: 'auto',
            });

            $.post("courseController/saveCounts",{id:id,counts:counts},function () {

            });

            $("#btn").click(function () {
                $.post("favoriteCourseController/favoriteCourse",{id:id},function (data) {
                    if(data.flag){
                        alert(data.msg);
                        $("#btn").prop("disabled","disabled");
                    }else{
                        //未登录，跳转登录页面
                        alert("您还未登录，请先登录！");
                        location.href="http://localhost:8080/LearningOnline/login.jsp";
                    }
                });
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
                <ul class="nav navbar-nav" style="margin-top: 5px">
                    <li  style="padding-left: 30px"><a href="course.jsp">课程 <span class="sr-only">(current)</span></a></li>
                    <li style="padding-left: 30px"><a href="section.jsp">章节学习</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <img src="images/header.jpg" id="head" style="width: 50px;height: 50px;margin-left: 1120px;margin-top: -60px"  class="img-circle">
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
<div id="dplayer"></div>
<script src="js/DPlayer.min.js"></script>

<div >
    <%--路径导航--%>
    <ol class="breadcrumb">
        <li style="float: left"><a href="http://localhost:8080/LearningOnline/index.jsp">首页</a></li>
        <li ><a href="http://localhost:8080/LearningOnline/course.jsp">课程</a></li>
        <li  class="active">视频播放</li>
    </ol>
</div>
<script>
    // 初始化定义视频
    var dp= new DPlayer({
        container: document.getElementById('dplayer'),
        autoplay: false,
        theme: '#FADFA3',
        loop: true,
        lang: 'zh-cn',
        screenshot: true,
        hotkey: true,
        preload: 'auto',
        volume: 0.7,
        mutex: true,
        // 视频地址及清晰度
        video: {
            url: 'video/b.mp4',
            pic: '',
            thumbnails: '',
            type: 'auto',
        },
        highlight: [
            {
                time: 20,
                text: '这是第 20 秒',
            },
            {
                time: 120,
                text: '这是 2 分钟',
            },
        ],
    });


</script>

<div class="pros_price" style="margin-top: 480px">
    <a class="btn" id="btn" disabled="" style="font-size: 25px"><i class="glyphicon glyphicon-heart-empty"></i>点击收藏</a>
</div>

</body>
</html>
