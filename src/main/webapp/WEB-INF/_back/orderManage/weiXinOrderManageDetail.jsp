<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/_front/common/taglib.jsp" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!doctype html>
<html class="no-js">
<head>
    <title>后台管理系统</title>
</head>
<body>
<!-- content start -->
<form class="am-form">
<div class="admin-content">

    <div class="am-cf am-padding">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">微信订单详情页面</strong> / <small>OrderDetail</small></div>
    </div>

    <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
            <div class="am-btn-toolbar">
                <div class="am-btn-group am-btn-group-xs">
                    <a href = "${ctx}/back/weiXinOrderManage" class="am-btn am-btn-primary"><span class="am-icon-angle-double-left"></span> 返回订单管理</a>
                </div>
            </div>
        </div>
    </div>

    <div class="am-g">
        <div class="am-u-sm-12">

                <table class="am-table am-table-striped am-table-hover table-main">
                    <thead>
                    <tr>
                        <th><input type="checkbox" name="items"/></th>
                        <th>食物名称</th>
                        <th>图片</th>
                        <th>单价</th>
                        <th>份数</th>
                        <th>描述</th>
                        <th>类型ID</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageList.list}" var="orderItem" varStatus="items">
                        <tr>
                            <td><input type="checkbox" name="item" value="${orderItem.id}"/></td>
                            <td>${orderItem.foodName}</td>
                            <td><img src="${ctx}/${orderItem.image}" width="50px" height="50px"></td>
                            <td><span class="am-icon-jpy">&nbsp;</span>${orderItem.price}</td>
                            <td>${orderItem.quantity} 份</td>
                            <td>${orderItem.description}</td>
                            <td>${orderItem.foodTypeId}</td>

                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <button class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 编辑</button>
                                        <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only del" data-id="${order.id}"><span class="am-icon-trash-o"></span> 删除</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
                <div class="am-cf">
                    <c:if test="${empty pageList.list}">
                        <div class="no-data">
                        <img src="${ctx}/resources/img/dataNoFound.png">
                        <div class="no-data-font">对不起，没有查询到该订单的详细商品项</div>
                        </div>
                    </c:if>
                    <tags:pagination page="${pageList}"/>
                </div>
                <hr />
        </div>
    </div>
</div>
<!-- content end -->
</div>
</form>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<content tag="script">
    <script src="${ctx}/resources/js/back/batchOperation.js" type="text/javascript"></script>
    <script type="text/javascript">
        BatchOperation.init("items", "item");
    </script>
</content>

</body>
</html>
