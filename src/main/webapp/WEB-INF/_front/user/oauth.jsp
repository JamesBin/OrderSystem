<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/_front/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户授权</title>
    <link rel="stylesheet" href="${ctx}/resources/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${ctx}/resources/css/decorator.css"/>
    <script src="${ctx}/resources/assets/js/jquery.min.js"></script>

</head>
<body>
<div class="am-g">

    <img class="oauth" src="${ctx}/resources/img/oauth.png">

    <div class="am-u-sm-12">
        <a href="http://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa9c3511f266e9592&redirect_uri=http://os.carp.mopaasapp.com/user/confirm&response_type=code&scope=snsapi_userinfo&state=wx#wechat_redirect" class="am-btn am-btn-success am-btn-block" style="border-radius: 5px;">确定登录</a>
    </div>
</div>
<content tag="script">
    <script>
        $(function () {
            var width = $(window).width();
            $('.oauth').css('width', width);
        });
    </script>
</content>
</body>
</html>