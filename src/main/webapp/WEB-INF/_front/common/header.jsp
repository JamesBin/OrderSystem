<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>
<header data-am-widget="header"
        class="am-header am-header-default headColor" >
    <div class="am-header-left am-header-nav">
        <a href="${ctx}/store" >
            <i class="am-header-icon am-icon-home"></i>
        </a>
        <a href="#phone-link"
           data-am-modal="{target: '#phone-modal', closeViaDimmer: 0, width: 300, height: 130}">
            <i class="am-header-icon am-icon-phone"></i>
        </a>
    </div>
    <h1 class="am-header-title">黄小吉</h1>

    <div class="am-header-right am-header-nav">
        <a href="#user-link" class="login">
            <i class="am-header-icon am-icon-user"></i>
        </a>
        <a href="#cart-link" class="car_link">
            <i class="am-header-icon am-icon-shopping-cart"></i>
        </a>
    </div>
</header>