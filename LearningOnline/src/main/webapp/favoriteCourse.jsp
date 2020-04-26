<%--
  Created by IntelliJ IDEA.
  User: 13470
  Date: 2020/4/22
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>我的收藏</title>
    <link rel="stylesheet"  href="css/common.css">
    <link rel="stylesheet"  href="css/ranking-list.css">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js "></script>
    <!--导入布局js，共享header和footer-->
    <script type="text/javascript" src="js/include.js"></script>

    <script src="js/getParameter.js"></script>

    <script>
        // 跳转到播放页面
        function Tovideo(video){
            location.href="http://localhost:8080/LearningOnline/video.jsp?video="+video+"";
        }

        // 入口函数
        $(function () {
            $.post("favoriteCourseController/findAllCourse",{},function (data) {
                // 列表展示
                var course_lis="";
                for(var x=0; x<data.length; x++){
                    var video=data[x].video;
                    var li='<li>\n' +
                        '                        <span class="num">'+(x+1)+'</span>\n' +
                        '                        <a href="http://localhost:8080/LearningOnline/video.jsp?video='+video+'&img='+data[x].img+'&id='+data[x].cid+'"><img src="'+data[x].img+'"  style="width: 250px;height: 130px;padding-left: 20px"></a>\n' +
                        '                        <h4><a  class="video" href="http://localhost:8080/LearningOnline/video.jsp?video='+video+'&img='+data[x].img+'&id='+data[x].cid+'">'+data[x].name+'</a></h4>\n' +
                        '                    </li>';

                    course_lis += li;
                }
                $("#course").html(course_lis);


            });
        });


    </script>
</head>
<body>
<!--引入头部-->
<div id="header"></div>
<div class="contant">
    <div class="list clearfix">
        <ul id="course">

        </ul>
    </div>


</div>
</body>
</html>