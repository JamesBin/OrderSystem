<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>

<div data-am-widget="navbar" class="am-navbar am-cf am-navbar-default ">
    <ul class="am-navbar-nav am-cf am-avg-sm-4">
        <li>
            <a href="${ctx}/store">
                <span class="am-icon-home am-icon-sm">&nbsp;</span>
                <span class="am-navbar-label">首页</span>
            </a>
        </li>
        <li>
            <a href="${ctx}/menu?id=${recommendStore}">
                <span class="am-icon-plus-square-o am-icon-sm">&nbsp;</span>
                <span class="am-navbar-label">订餐</span>
            </a>
        </li>
        <li>
            <a href="${ctx}/order/historyOrder">
                <span class="am-icon-list am-icon-sm">&nbsp;</span>
                <span class="am-navbar-label">历史订单</span>
            </a>
        </li>
    </ul>
</div>