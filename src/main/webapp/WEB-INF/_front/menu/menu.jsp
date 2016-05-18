<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/_front/common/taglib.jsp" %>
<!DOCTYPE HTML>
<html ng-app>
<head>
    <title>推荐菜单</title>
    <content tag="css">
        <link rel="stylesheet" href="${ctx}/resources/css/menu.css">
    </content>
</head>

<body>
<jsp:include page="/WEB-INF/_front/common/header.jsp"/>

<form action="${ctx}/order/saveOrder" class="am-form" id="menuForm" method="post">
    <div class="am-g chooseMenu">
        <div class="am-u-sm-4 typeContainer">
            <ul class="am-list type">
                <c:forEach items="${foodTypeList}" var="type" varStatus="status">
                    <li><a href="#tab${status.count}" data-id="#tab${status.count}"
                           class="typeName">${type.foodTypeName}</a></li>
                </c:forEach>
            </ul>
        </div>
        <div class="am-u-sm-8 foodContainer">
            <div class="am-g">
                <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered menu">
                    <div class="am-g">
                        <div class="am-badge am-badge-warning am-text-default am-fl am-u-sm-7"
                             style="margin-bottom:10px;font-size:14px">今日特色菜推荐&nbsp;<span
                                class="am-icon-thumbs-o-up"></span></div>
                        <div class="am-badge am-badge-success am-text-default am-fr am-u-sm-4" style="font-size:14px">
                            <c:if test="${empty store.storeName}">
                                <a href="${ctx}/store" style="color:white">请选择门店</a>
                            </c:if>
                            ${store.storeName}
                        </div>
                    </div>

                    <c:forEach items="${foodList}" var="food" varStatus="status">
                        <div class="am-g" style="margin-bottom: 20px;" id="tab${food.foodTypeId}">
                            <div class="am-u-sm-4 am-u-md-5 foodImage">
                                <img class="lazy" data-original="${ctx}/${food.image}" width="65px" height="65px">
                            </div>
                            <div class="am-u-sm-4 am-u-md-4 foodInfo">
                                <div class="foodName_${status.count}"><span class="foodName">${food.foodName}</span>
                                </div>
                                <div class="comment">销量<c:if test="${food.amount == null}">0</c:if>${food.amount}&nbsp;好评0</div>
                                <div class="price">￥<span>${food.price }</span></div>
                            </div>
                            <div class="am-u-sm-4 am-u-md-3 amount">
                                <div class='am-badge am-badge-warning am-round am-text-default am-u-sm-4 am-fr plus'
                                     style="cursor:pointer">+
                                </div>
                                <input class="quantity" type="hidden" name="saleOrderItem_${status.count}.quantity"
                                       value="0"/>
                            </div>
                        </div>
                        <input type="hidden" id="foodId" name="saleOrderItem_${status.count}.foodId" value="${food.id}">
                        <input type="hidden" id="price" name="saleOrderItem_${status.count}.price"
                               value="${food.price}">
                    </c:forEach>
                    <hr/>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="orderInfo.jsp" flush="true"/>

    <div data-am-widget="navbar" class="am-navbar am-cf am-navbar-default am-animation-scale-up">
        <ul class="am-navbar-nav am-cf am-avg-sm-1">
            <li class="userFunction"></li>
        </ul>
    </div>
    <input type="hidden" id="total" name="order.total" value="0.0">
    <input type="hidden" name="order.storeId" value="${store.id}">
    <input type="hidden" name="size" value="${fn:length(foodList)}">
    <input type="hidden" name="orderId" value="${saleOrder.id}">
    <input type="hidden" id="orderRequire" name="order.require" value="无">

</form>
<jsp:include page="menuModal.jsp" flush="true"/>
<input type="hidden" value="${recommendStore}" id="recommend">
<input type="hidden" class="alert" data-am-modal="{target: '#my-alert'}">
<input type="hidden" class="orderInfoNullAlert" data-am-modal="{target: '#orderInfoNull-alert'}">
<input type="hidden" class="top" value="0"/>

<content tag="script">
    <script src="${ctx}/resources/lazyload/amazeui.lazyload.min.js"></script>
    <script src="${ctx}/resources/js/front/countMenuList.js"></script>
    <script type="text/javascript">
        $(function () {
            CountMenuList.init();
        });
    </script>
</content>
</body>
</html>