<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/_front/common/taglib.jsp" %>

<!doctype html>
<html class="no-js">
<head>
    <title>后台管理系统</title>
</head>
<body>
<!-- content start -->
<form class="am-form" id="listForm" action="${ctx}/back/orderManage" method="post">
    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">电话订单管理</strong> /
                <small>order</small>
            </div>
        </div>

        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 录入
                        </button>
                        <a class="am-btn am-btn-default delAll"><span class="am-icon-trash-o"></span> 删除所选项</a>
                    </div>
                </div>
            </div>

            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-form-group">
                    <div class="am-form-group">
                        <jsp:include page="/WEB-INF/common/dateTime.jsp">
                            <jsp:param name="selected" value="choose"/>
                            <jsp:param name="lastSelected" value="${dateSelect}"/>
                            <jsp:param name="start_dataTime" value="start_createTime"/>
                            <jsp:param name="end_dataTime" value="end_createTime"/>
                            <jsp:param name="start_dataTime_value" value="${start_dataTime_value}"/>
                            <jsp:param name="end_dataTime_value" value="${end_dataTime_value}"/>
                        </jsp:include>
                    </div>
                </div>
            </div>

            <div class="am-u-sm-12 am-u-md-3" style="padding-left: 35px;">
                <div class="am-input-group am-input-group-sm">
                    <input type="text" class="am-form-field" name="search_orderNo" placeholder="输入订单号"  value="${search_orderNo}">
                <span class="am-input-group-btn">
                      <button type="submit" id="search" class="am-btn am-btn-default" type="button"><span class="am-icon-search">&nbsp;</span>搜索</button>
                </span>
                </div>
            </div>
        </div>

        <div class="am-g orderPanel">
            <div class="am-u-sm-12">
                <table class="am-table am-table-striped am-table-hover table-main">
                    <thead>
                    <tr>
                        <th><input type="checkbox" name="items"/></th>
                        <th>序号</th>
                        <th>订单号</th>
                        <th>创建日期</th>
                        <th>总额</th>
                        <th>用户号</th>
                        <th>门店</th>
                        <th>订单来源</th>
                        <th>状态</th>
                        <th>
                            <span style="margin-right: 25px;">操作</span>
                            <input id="toExcel" type="button" class="am-btn am-btn-xs am-btn-success" value="导出Excel"/>
                        </th>
                    </tr>
                    </thead>
                    <tbody>



                    <c:forEach items="${pageList.list}" var="order" varStatus="items">
                        <tr>
                            <td><input type="checkbox" name="item" value="${order.id}"/></td>
                            <td>${(pageList.pageNumber - 1) * pageList.pageSize +items.count}</td>
                            <td><a href="${ctx}/back/orderManageDetail?orderId=${order.orderId}" title="订单详情">${order.orderNo}</a></td>
                            <td><fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td><span class="am-icon-jpy">&nbsp;</span> ${order.total}</td>
                            <td><c:if test="${order.userId == null}">散客</c:if>${order.userId}</td>
                            <td>${order.storeName}</td>
                            <td>电话订单</td>
                            <td><c:if test="${order.status == 0}">未支付</c:if></td>
                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <button class="am-btn am-btn-default am-btn-xs am-text-secondary edit" data-am-modal="{target: '#edit-modal'}" data-id="${order.orderId}"><span
                                                class="am-icon-pencil-square-o"></span> 编辑
                                        </button>
                                        <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only del doc-confirm-toggle del"
                                                data-id="${order.orderId}"><span class="am-icon-trash-o"></span> 删除
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:if test="${empty pageList.list}">
                    <div class="no-data">
                        <img src="${ctx}/resources/img/dataNoFound.png">
                        <div class="no-data-font">对不起，没有查询到相应的订单流水数据</div>
                    </div>
                </c:if>
                <tags:pagination page="${pageList}"/>
            </div>

        </div>
    </div>
    <!-- content end -->
    </div>

    <input type="hidden" id="delId" value=""/>
    <input type="hidden" id="nullData" data-am-modal="{target: '#nullData-modal', closeViaDimmer: 0, width: 300, height: 130}"/>

</form>
<jsp:include page="../modal/orderModal.jsp"/>

<content tag="script">
    <script src="${ctx}/resources/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
    <script src="${ctx}/resources/select2/select2.min.js" type="text/javascript"></script>
    <script src="${ctx}/resources/select2/select2_locale_zh-CN.js" type="text/javascript"></script>
    <script src="${ctx}/resources/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="${ctx}/resources/js/back/manageOrderData.js" type="text/javascript"></script>
    <script src="${ctx}/resources/js/back/batchOperation.js" type="text/javascript"></script>
    <script src="${ctx}/resources/js/common/customDateTime.js" type="text/javascript"></script>
    <script>
        $(function () {
            BatchOperation.init("items", "item");
            CustomDateTime.init();
            ManageOrderData.init();
        });
    </script>
</content>

</body>
</html>
