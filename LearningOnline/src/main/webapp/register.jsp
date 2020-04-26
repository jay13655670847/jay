
<%--
  Created by IntelliJ IDEA.
  User: 13470
  Date: 2020/4/6
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>

    <script src="js/jquery-3.3.1.min.js"></script>

    <style>
        body{
            background-image: url("images/background.jpg");
        }

        .rg_layout{
            border-style: solid;
            width: 900px;
            height: 500px;
            border-width: 8px;
            border-color:silver;
            background: white;
            margin: auto;
            margin-top: 80px;
        }

        .rg_left{
            float: left;
            margin-left: 20px;
            font-size: 20px;
        }

        .rg_center{
            padding-top: 30px;
            margin:auto;
        }

        .rg_right{
            float: right;
            margin-right: 20px;
            margin-top: -410px;
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

        #name{
            border-radius: 5px;
            height: 30px;
            width: 250px;
        }

        #PhoneNumber{
            border-radius: 5px;
            height: 30px;
            width: 250px;
        }

        #checkcode{
            border-radius: 5px;
            height: 30px;
            width: 150px;
        }

        .birthday{
            font-size: 15px;
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

    </style>

    <script>
        $(function () {
            //给username输入框添加离焦事件
            function checkUsername(){
                var username = $("#username").val();
                //.定义正则
                var reg_username = /^\w{8,20}$/;
                //.判断，给出提示信息
                var flag = reg_username.test(username);
                if(flag){
                    //flag为true,用户名可用
                    $("#msg_username").html("✔");
                    $("#msg_username").css("color","green");
                }else {
                    $("#msg_username").html("✘");
                    $("#msg_username").css("color","red");
                }
            }

            $("#username").blur(checkUsername);

            //校验密码格式
            $("#password").blur(checkPassword);

            function checkPassword() {
                var password = $("#password").val();

                //.定义正则
                var reg_username = /^\w{6,20}$/;
                //.判断，给出提示信息
                var flag = reg_username.test(password);
                if(flag){
                    $("#msg_password").html("✔");
                    $("#msg_password").css("color","green");
                }else {
                    $("#msg_password").html("✘");
                    $("#msg_password").css("color","red");
                }
            }

            //校验姓名
            $("#name").blur(checkName);

            function checkName() {
                var name = $("#name").val();

                if(name.length!=0){
                    $("#msg_name").html("✔");
                    $("#msg_name").css("color","green");
                }else {
                    $("#msg_name").html("✘");
                    $("#msg_name").css("color","red");
                }
            }

            //校验手机号
            $("#PhoneNumber").blur(checkPhone);

            function checkPhone() {
                var phone = $("#PhoneNumber").val();
                //.定义正则
                var reg_username = /^\d{11}$/;
                //.判断，给出提示信息
                var flag = reg_username.test(phone);
                if(flag){
                    $("#msg_phone").html("✔");
                    $("#msg_phone").css("color","green");
                }else {
                    $("#msg_phone").html("✘");
                    $("#msg_phone").css("color","red");
                }
            }

            $("#form").submit(function () {

                    $.post("registerUser/register",$("#form").serialize(),function (data) {
                        if(data.flag){
                            location.href="login.jsp";
                        }else {
                            $("#errorMsg").html(data.msg);
                        }
                    });

                return false;
            });
        });
    </script>

</head>
<body>

<div class="rg_layout">
    <div class="rg_left">
        <p><font color="#ffd700">新用户注册</font></p>
        <p>USER REGISTER</p>
    </div>

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
                            <span id="msg_username"></span>
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left">
                            <label for="password">密码</label>
                        </td>
                        <td class="td_right">
                            <input type="password" placeholder="请输入密码" name="password" id="password"/>
                            <span id="msg_password"></span>
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left">
                            <label for="name">姓名</label>
                        </td>
                        <td class="td_right">
                            <input type="text" placeholder="请输入真实姓名" name="name" id="name"/>
                            <span id="msg_name"></span>
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left">
                            <label for="PhoneNumber">请输入手机号</label>
                        </td>
                        <td class="td_right">
                            <input type="text" placeholder="请输入手机号码" name="phone" id="PhoneNumber"/>
                            <span id="msg_phone"></span>
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left">
                            <label>性别</label>
                        </td>
                        <td class="td_right">
                            <input type="radio" name="gender" value="男"/>男
                            <input type="radio" name="gender" value="女"/>女
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left">
                            <label>出生日期</label>
                        </td>
                        <td class="td_right">
                            <input type="date" name="birthday" class="birthday"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left">
                            <label for="checkcode">验证码</label>
                        </td>
                        <td class="td_right" >
                            <input name="checkcode" id="checkcode"><img id="img" src="http://localhost:8080/LearningOnline/checkCode" alt="" onclick="changeCheckCode(this)">
                            <span id="msg_checkcode"></span>
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
                            <center><input type="submit" name="submit" value="注册" id="submit"/></center>
                        </td>
                    </tr>
                </table>
            </form>
            <div id="errorMsg" style="color:red;text-align: center"></div>
        </div>
    </div>

    <div class="rg_right">
        <p>已有账号？<a href="login.jsp" ><font color="#dc143c">立即登录</font></a></p>

    </div>
</div>

</body>
</html>
