<%--
  Created by IntelliJ IDEA.
  User: 13470
  Date: 2020/4/11
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>计算机组成原理-章节知识点学习</title>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js "></script>
    <script src="js/getParameter.js"></script>

    <script>
        function parentLoadRight(id) {
            $("#right").prop("src","sectionRight.jsp#"+id+"");
        }
    </script>
</head>
<body>

<div>
<%--    路径导航--%>
    <div>
        <ol class="breadcrumb" style="width: 1100px;margin-left: 410px" >
            <li><a href="index.jsp">首页</a></li>
            <li class="active">章节学习</li>
        </ol>
    </div>

<%--    章节目录--%>
    <div style="float: left;margin-left: 1px">
        <iframe src ="sectionLeft.jsp" width="300px" height="800px;m"  scrolling="yes">
            <p>Your browser does not support iframes.</p>
        </iframe>
    </div>

<%--    知识点--%>
    <div style="float: right">
        <iframe id="right" src ="sectionRight.jsp" width="1100px" height="800px" scrolling="yes" style="padding-left: 20px;">
            <p>Your browser does not support iframes.</p>
        </iframe>
    </div>
</div>

</body>
</html>
