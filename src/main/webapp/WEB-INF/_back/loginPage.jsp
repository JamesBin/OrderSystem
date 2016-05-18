<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>
<html>
   <head>
       <title>系统登录</title>
       <link href="${ctx}/resources/Wopop_files/style_log.css" rel="stylesheet" type="text/css">
       <link rel="stylesheet" type="text/css" href="${ctx}/resources/Wopop_files/style.css">
   </head>

<body class="login" mycollectionplug="bind">
<div class="login_m">
    <div class="login_logo"><img src="${ctx}/resources/Wopop_files/logo.png" width="340px;"></div>
    <div class="login_boder">
    <form id="loginForm" action="${ctx}/back/adminLogin" method="post">
        <div class="login_padding" id="login_model">
            <h2>用户名</h2>
            <label>
                <input type="text" id="username" name="user.username" class="txt_input txt_input2"  placeholder="Your name"  required>
            </label>
            <h2>密码</h2>
            <label>
                <input type="password" id="password" name="user.password"  class="txt_input" placeholder="password"  required>
            </label>

            <p class="forgot"><span class="error" style="margin-right: 150px;color: red">${errorMsg}</span><a id="forget" href="javascript:void(0);">  忘记密码?${errorMsg}</a></p>
            <span class="am-fl"></span>
            <div class="rem_sub">
                <div class="rem_sub_l">
                    <input type="checkbox" name="checkbox" id="save_me">
                    <label for="save_me">&nbsp;记住我</label>
                </div>
                <label>
                    <input type="submit" class="sub_button" name="button" id="button" value="登录" style="opacity: 0.7;">
                </label>
            </div>
        </div>
    </form>
    </div>
</div>
<script src="${ctx}/resources/assets/js/jquery.min.js"></script>
<script>
    $(function () {
        $('#username').focus();
        $('.sub_button').on('click', function (e) {
            e.preventDefault();
            if (!validateForm()) {
                return ;
            }
            $('#loginForm').submit();
        });

        $('#username,#password').on('blur', function () {
            validateForm();
        })

        function validateForm () {
            var username = $('#username').val();
            var password = $('#password').val();
            if (username == "" ) {
                $('.error').html("用户名不能为空")
                return false;
            }

            if (password == "" ) {
                $('.error').html("密码不能为空")
                return false;
            }
            $('.error').html("")
            return true;
        }
    });
</script>
</body>
</html>