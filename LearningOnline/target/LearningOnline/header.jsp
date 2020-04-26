<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js "></script>

    <script>
        $(function () {
            //搜索
            $("#search-btn").click(function () {
                var search = $("#search-input").val();
                if(search){
                    search=window.decodeURIComponent(search);
                }
                location.href="http://localhost:8080/LearningOnline/course.jsp?search="+search+"";
            });
        });
    </script>

<header id="header">
<div style="width: 2000px">
    <nav class="navbar navbar-inverse" >
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
                <ul class="nav navbar-nav" >
                    <li  style="padding-left: 30px"><a href="course.jsp">课程 <span class="sr-only">(current)</span></a></li>
                    <li style="padding-left: 30px"><a href="section.jsp">章节学习</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right" style="margin-top: -40px">
                    <li style="width: 600px;padding-left: 150px "> <div class="col-lg-6">
                        <div class="input-group">
                            <input type="text" class="form-control" id="search-input">
                            <span class="input-group-btn">
                        <button class="btn btn-default" type="button" id="search-btn">搜索</button>
                        </span>
                        </div><!-- /input-group -->
                    </div><!-- /.col-lg-6 --></li>
                    <li class="dropdown">
                        <img src="images/header.jpg" style="width: 50px;height: 50px;margin-right: 20px"  class="img-circle">
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
</header>