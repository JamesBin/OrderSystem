<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/_front/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,user-scalable=no"/>
    <title>登录界面</title>
    <link rel="stylesheet" href="${ctx}/resources/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${ctx}/resources/css/decorator.css"/>
    <script src="${ctx}/resources/assets/js/jquery.min.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/_front/common/header.jsp"/>

<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <span class="pageTitle">用户登录</span>
        <hr>

        <form action= "${ctx}/user/login" method="post" class="am-form">
            <label for="username">用户名:</label>
            <input type="text" name="user.username" id="username">
            <br>
            <label for="password">密码:</label>
            <input type="password" name="user.password" id="password">
            <br>
            <label for="remember-me">
                <input id="remember-me" type="checkbox">
                记住密码
            </label>
            <br />
            <div class="am-cf">

                <a href="${ctx}/user/register"  class="am-btn am-btn-warning am-btn-sm" style="margin-left:10px;">注 册</a>
                <a href="javascript:history.back()" class="am-btn am-btn-default am-btn-sm" style="margin-left:10px;">返回</a>
                <%--<input  name="" value="忘记密码 ^_^? " class="am-btn am-btn-default am-btn-sm am-fr">--%>
            </div>
        </form>
        <center>©Powered by zwb_scau.</center>
    </div>
</div>
<jsp:include page="/WEB-INF/_front/common/footer.jsp"/>
</body>
</html>