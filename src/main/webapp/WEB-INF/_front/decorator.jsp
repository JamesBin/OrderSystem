<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/WEB-INF/_front/common/taglib.jsp" %>
<decorator:usePage id="thePage" />
<!DOCTYPE HTML>
<html ng-app>
<head>

    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title></title>

    <link rel="icon" type="image/png" href="${ctx}/resources/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${ctx}/resources/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="${ctx}/resources/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${ctx}/resources/css/decorator.css"/>

    <c:if test="${thePage.getProperty('page.css')!=null}">
        <sitemesh:getProperty property="page.css"/>
    </c:if>

</head>
<body>

<decorator:body/>


<script type="text/javascript" src="${ctx}/resources/js/common/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/assets/js/app.js"></script>

<c:if test="${thePage.getProperty('page.script')!=null}">
    <decorator:getProperty property="page.script"/>
</c:if>

</body>
</html>