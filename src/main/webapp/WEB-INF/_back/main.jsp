<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<decorator:usePage id="thePage" />
<!DOCTYPE HTML>
<html ng-app>
<head>
    <c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title><decorator:title/></title>

    <link rel="icon" type="image/png" href="${ctx}/resources/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${ctx}/resources/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="${ctx}/resources/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${ctx}/resources/assets/css/admin.css">
    <link rel="stylesheet" href="${ctx}/resources/css/back/back.css"/>

    <c:if test="${thePage.getProperty('page.css')!=null}">
        <sitemesh:getProperty property="page.css"/>
    </c:if>
</head>
<body class="template">
    <header class="am-topbar admin-header">
        <div class="am-topbar-brand">
            <strong  style="color: #ffbe40">黄小吉</strong> <small> 后台管理系统</small>
        </div>

        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

        <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

            <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
                <li><a href="javascript:;"><span class="am-icon-envelope-o"></span> 收件箱 <span class="am-badge am-badge-warning">5</span></a></li>
                <li class="am-dropdown" data-am-dropdown>
                    <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
                        <span class="am-icon-users"></span> 管理员 <span class="am-icon-caret-down"></span>
                    </a>
                    <ul class="am-dropdown-content">
                        <li><a href="${ctx}/back/adminInfo"><span class="am-icon-user"></span> 资料</a></li>
                        <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
                        <li><a href="${ctx}/back/logout"><span class="am-icon-power-off"></span> 退出</a></li>
                    </ul>
                </li>
                <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
            </ul>
        </div>
    </header>

    <div class="am-cf admin-main">
        <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
            <div class="am-offcanvas-bar admin-offcanvas-bar">
                <ul class="am-list admin-sidebar-list">
                    <li><a href="${ctx}/back/mainPage"><span class="am-icon-home ">&nbsp;</span>首页</a></li>
                    <li class="admin-parent">
                        <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file">&nbsp;</span>系统管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                        <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
                            <li><a href="${ctx}/back/userManage" class="am-cf"><span class="am-icon-user">&nbsp;</span>用户管理<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
                            <li><a href="${ctx}/back/menuManage"><span class="am-icon-shopping-cart">&nbsp;</span>餐饮管理</a></li>
                            <li><a href="${ctx}/back/commentManage"><span class="am-icon-renren">&nbsp;</span>评论管理</a></li>
                            <li><a href="${ctx}/back/logManage"><span class="am-icon-calendar">&nbsp;</span>日志管理</a></li>
                        </ul>
                    </li>

                    <li class="admin-parent">
                        <a class="am-cf" data-am-collapse="{target: '#collapse-navOrder'}"><span class="am-icon-reorder">&nbsp;</span>订单管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                        <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-navOrder">
                            <li><a href="${ctx}/back/weiXinOrderManage"><span class="am-icon-weixin">&nbsp;</span>微信订单管理<span class="am-badge am-badge-secondary am-margin-right am-fr">10</span></a></li>
                            <li><a href="${ctx}/back/phoneOrderManage"><span class="am-icon-phone">&nbsp;</span>电话订单管理</a></li>
                            <li><a href="${ctx}/back/thirdPartyOrderManage"><span class="am-icon-th-large">&nbsp;</span>第三方订单管理</a></li>
                        </ul>
                    </li>

                    <li class="admin-parent">
                        <a class="am-cf" data-am-collapse="{target: '#collapse-navReport'}" ><span class="am-icon-bar-chart" >&nbsp;</span>报表统计<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                        <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-navReport">
                            <li><a href="${ctx}/back/monthSaleReport"  class="am-cf"><span class="am-icon-line-chart">&nbsp;</span>门店销售额月报表</a></li>
                            <li><a href="${ctx}/back/yearSaleReport" ><span class="am-icon-area-chart">&nbsp;</span>门店销售额年报表</a></li>
                            <li><a href="${ctx}/back/productHeatReport" ><span class="am-icon-bar-chart">&nbsp;</span>商品热度月报表</a></li>
                            <li><a href="${ctx}/back/customHeatReport" ><span class="am-icon-pie-chart">&nbsp;</span>顾客忠诚度报表</a></li>
                        </ul>
                    </li>
                    <%--<li><a href="manage/menuManage.jsp"><span class="am-icon-pencil-square-o">&nbsp;</span>表单</a></li>--%>
                    <li><a href="${ctx}/back/logout"><span class="am-icon-sign-out">&nbsp;</span>注销</a></li>
                </ul>

                <div class="am-panel am-panel-default admin-sidebar-panel">
                    <div class="am-panel-bd">
                        <p><span class="am-icon-bookmark"></span> 公告</p>
                        <p>Powered by zwb_scau</p>
                    </div>
                </div>

                <div class="am-panel am-panel-default admin-sidebar-panel">
                    <div class="am-panel-bd">
                        <p><span class="am-icon-tag"></span> wiki</p>
                        <p>Welcome to the OrderSystem Background !</p>
                    </div>
                </div>
            </div>
        </div>

        <decorator:body/>
    </div>

    <footer>
        <hr>
        <div style="text-align: center">© 2015 Powered by zwb_scau.</div>
    </footer>
</div>

    <script src="${ctx}/resources/assets/js/jquery.min.js"></script>
    <script src="${ctx}/resources/assets/js/amazeui.min.js"></script>
    <script src="${ctx}/resources/assets/js/app.js"></script>

    <script>
        $(function () {
            if ($('.login_m').length != 0) {
                $('.template').hide();
                window.location.href = "${ctx}/back";
            }
        });
    </script>
    <c:if test="${thePage.getProperty('page.script')!=null}">
        <decorator:getProperty property="page.script"/>
    </c:if>

    <c:if test="${thePage.getProperty('page.pageScript')!=null}">
        <decorator:getProperty property="page.pageScript"/>
    </c:if>

</body>
</html>