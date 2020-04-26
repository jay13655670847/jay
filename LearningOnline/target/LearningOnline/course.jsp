<%--
  Created by IntelliJ IDEA.
  User: 13470
  Date: 2020/4/9
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>计算机组成原理在线学习平台--课程</title>
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
            var search = getParameter("search");
            search=window.decodeURIComponent(search);
            $.post("courseController/findCourse",{currentPage:$("#currentPage").val(),search:search},function (data) {
                // 列表展示
                var course_lis="";
                for(var x=0; x<data.list.length; x++){
                    var video=data.list[x].video;
                    var li='<li>\n' +
                        '                        <span class="num">'+(x+1)+'</span>\n' +
                        '                        <a href="http://localhost:8080/LearningOnline/video.jsp?video='+video+'&img='+data.list[x].img+'&id='+data.list[x].id+'&counts='+data.list[x].counts+'"><img src="'+data.list[x].img+'"  style="width: 250px;height: 130px;padding-left: 20px"></a>\n' +
                        '                        <h4><a  class="video" href="http://localhost:8080/LearningOnline/video.jsp?video='+video+'&img='+data.list[x].img+'&id='+data.list[x].id+'&counts='+data.list[x].counts+'">'+data.list[x].name+'</a></h4>\n' +
                        '                        <p>\n' +
                        '                            <span class="shouchang">已播放'+data.list[x].counts+'次</span>\n' +
                        '                        </p>\n' +
                        '                    </li>';

                    course_lis += li;
                }
                $("#course").html(course_lis);

                // 分页
                var lis="";
                var fristPage ='<li onclick="javascipt:load()"><a href="javascript:void(0)">首页</a></li>';

                var beforeNum=data.currentPage-1;
                if(beforeNum <= 0){
                    beforeNum = 1;
                }

                var beforePage = '<li  onclick="javascipt:load('+beforeNum+')" class="threeword"><a href="javascript:void(0)">上一页</a></li>';

                lis += fristPage;
                lis += beforePage;

                var begin; // 开始位置
                var end ; //  结束位置


                //1.要显示10个页码
                if(data.totalPage < 10){
                    //总页码不够10页

                    begin = 1;
                    end = data.totalPage;
                }else{
                    //总页码超过10页

                    begin = data.currentPage - 5 ;
                    end = data.currentPage + 4 ;

                    //2.如果前边不够5个，后边补齐10个
                    if(begin < 1){
                        begin = 1;
                        end = begin + 9;
                    }

                    //3.如果后边不足4个，前边补齐10个
                    if(end > data.totalPage){
                        end = data.totalPage;
                        begin = end - 9 ;
                    }
                }

                for (var i = begin; i <= end ; i++) {
                    var li;
                    //判断当前页码是否等于i
                    if(data.currentPage == i){

                        li = '<li class="curPage" onclick="javascipt:load('+i+')"><a href="javascript:void(0)">'+i+'</a></li>';

                    }else{
                        //创建页码的li
                        li = '<li onclick="javascipt:load('+i+')"><a href="javascript:void(0)">'+i+'</a></li>';
                    }
                    //拼接字符串
                    lis += li;
                }

                var nextNum=data.currentPage+1;
                if(nextNum>data.totalPage){
                    nextNum=data.totalPage;
                }
                var lastPage = '<li  onclick="javascipt:load('+nextNum+')" class="threeword"><a href="javascript:void(0)">下一页</a></li>';
                var nextPage = '<li  onclick="javascipt:load('+data.totalPage+')" class="threeword"><a href="javascript:void(0)">末页</a></li>';

                lis += nextPage;
                lis += lastPage;

                $("#pageNum").html(lis);

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


    <div class="pageNum">
        <ul id="pageNum">

        </ul>
    </div>

</div>
</body>
</html>
