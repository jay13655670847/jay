<%--
  Created by IntelliJ IDEA.
  User: 13470
  Date: 2020/4/6
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>

    <script src="js/jquery-3.3.1.min.js"></script>

    <style>
        body{
            background-image: url("images/background.jpg");
        }

        .rg_layout{
            border-style: solid;
            width: 600px;
            height: 250px;
            border-width: 8px;
            border-color:silver;
            background: white;
            margin:auto;
            margin-top: 200px;
            padding-top: 30px;
        }


        .rg_center{
            padding-top: 30px;
            padding-left: 50px;
            margin:auto;
        }

        .rg_right{
            float: right;
            margin-right: 20px;
            margin-top: -50px;
        }

        .td_left{
            text-align: right;
            line-height: 45px;
        }

        .td_right{
            padding-left: 40px;
            border-radius: 5px;
        }

        #username{
            border-radius: 5px;
            height: 30px;
            width: 250px;
        }

        #password{
            border-radius: 5px;
            height: 30px;
            width: 250px;
        }

        #checkcode{
            border-radius: 5px;
            height: 30px;
            width: 150px;
        }


        #img{
            vertical-align: middle;
            padding-left: 10px;
        }

        #submit{
            width: 80px;
            height: 40px;
            background: gold;
            border: 1px ;
            border-radius: 5px;
        }

        #img{
            margin-left:10px;
        }

        #top{
            margin-left: 430px;
            margin-top: -250px;
        }

    </style>

    <script>
        // 入口函数
        $(function () {
            $("#submit").click(function () {
               //异步交互，判断用户名密码是否正确
                $.post("loginUserController/login",$("#form").serialize(),function (data) {
                    if(data.flag){
                        location.href="index.jsp";
                    }else{
                        $("#errorMsg").html(data.msg);
                    }

                });
            });
        });

    </script>

</head>
<body>

<div class="rg_layout">

    <div class="rg_center">
        <div class="rg_form">
            <form action="" id="form" method="post">
            <table >
                <tr>
                    <td class="td_left">
                        <label for="username">用户名</label>
                    </td>
                    <td width="300" class="td_right">
                        <input type="text" placeholder="请输入账号" name="username" id="username"/>
                    </td>
                </tr>

                <tr>
                    <td class="td_left">
                        <label for="password">密码</label>
                    </td>
                    <td class="td_right">
                        <input type="password" placeholder="请输入密码" name="password" id="password"/>
                    </td>
                </tr>

                <tr>
                    <td class="td_left">
                        <label for="checkcode">验证码</label>
                    </td>
                    <td class="td_right" >
                        <input name="checkcode" id="checkcode"><img id="img" src="http://localhost:8080/LearningOnline/checkCode" alt="" onclick="changeCheckCode(this)">
                        <script type="text/javascript">
                            //图片点击事件
                            function changeCheckCode(img) {
                                img.src="http://localhost:8080/LearningOnline/checkCode?"+new Date().getTime();
                            }
                        </script>
                    </td>
                </tr>

                <tr align="center" >
                    <td align="center" colspan="2" >
                        <center><input type="button"  name="submit" value="登录" id="submit"  /></center>
                    </td>
                </tr>
            </table>
            </form>
            <div id="errorMsg" style="color:red;text-align: center"></div>
        </div>
    </div>

    <div class="rg_right">
        <p>没有账号？<a href="register.jsp" ><font color="#dc143c">立即注册</font></a></p>
    </div>

    <div id="top">
        <p><font color="#ffd700" size="6px">用户登录</font></p>
    </div>
</div>

</body>
</html>
