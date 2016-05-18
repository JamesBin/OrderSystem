<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/_front/common/taglib.jsp" %>
<!DOCTYPE HTML>
<html ng-app>
<head>
    <title>历史订单</title>
</head>

<body>

<header data-am-widget="header"
        class="am-header am-header-default" style="background-color: #5ABA5C !important;">
    <div class="am-header-left am-header-nav">
        <a href="${ctx}/" class="">
            <i class="am-header-icon am-icon-home"></i>
        </a>
        <a href="#phone-link" class=""
           data-am-modal="{target: '#phone-modal', closeViaDimmer: 0, width: 300, height: 130}">
            <i class="am-header-icon am-icon-phone"></i>
        </a>
    </div>
    <h1 class="am-header-title"><span class="titleTips">下单成功&nbsp;<span class="am-icon-check am-icon-sm"></span></span></h1>

    <div class="am-header-right am-header-nav">
        <a href="#user-link" class="">
            <i class="am-header-icon am-icon-user"></i>
        </a>
        <a href="#cart-link" class="">
            <i class="am-header-icon am-icon-shopping-cart"></i>
        </a>
    </div>
</header>

<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">

        <hr>
        <div style="text-align: center;margin-top:100px;font-size: 18px;">您好，商家已经接收外卖订单<br/>正在火速配送中...&nbsp;<span
                class="am-icon-rocket"></span></div>
        <hr>
    </div>
</div>

<jsp:include page="/WEB-INF/_front/common/footer.jsp"/>

</body>
</html>