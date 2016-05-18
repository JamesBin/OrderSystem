<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!doctype html>
<html class="no-js">
<head>
    <title>后台管理系统</title>
    <content tag="css">
        <link href="${ctx}/resources/jquery-Upload/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="${ctx}/resources/jquery-Upload/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    </content>
</head>
<body>

<form class="am-form" id="listForm" method="post" action="${ctx}/back/menuManage">
    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">餐饮</strong> /
                <small>Manage</small>
            </div>
        </div>

        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-6">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <button type="button" class="am-btn am-btn-default"
                                data-am-modal="{target: '#add-modal'}"><span
                                class="am-icon-plus"></span> 新增商品
                        </button>
                        <button type="button" class="am-btn am-btn-default"
                                data-am-modal="{target: '#addType-modal'}"><span class="am-icon-save"></span> 新增类型</button>
                        <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 类型管理</button>
                        <button type="button" class="am-btn am-btn-default delAll"><span class="am-icon-trash-o"></span> 删除所选项</button>

                    </div>
                </div>
            </div>

            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-form-group ">
                    <select name="typeId" data-am-selected="{btnSize: 'sm'}">
                        <option value="-1">选择商品类型</option>
                        <c:forEach items="${foodTypeList}" var="type">
                            <option value="${type.id}" <c:if test="${typeId == type.id}">selected</c:if> >${type.id}-${type.foodTypeName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-input-group am-input-group-sm">
                    <input type="text" class="am-form-field" name="searchName" placeholder="输入食物名"
                           value="${searchName}" />
                    <span class="am-input-group-btn">
                        <button type="submit" class="am-btn am-btn-default search" type="button"><span class="am-icon-search">&nbsp;</span>搜索</button>
                    </span>
                </div>
            </div>
        </div>

        <div class="am-g dataPanel">
            <div class="am-u-sm-12">

                <table class="am-table am-table-striped am-table-hover table-main">
                    <thead>
                    <tr>
                        <th><input type="checkbox" name="items"/></th>
                        <th>序号</th>
                        <th>食物名称</th>
                        <th>价格</th>
                        <th>图片</th>
                        <th>描述</th>
                        <th>食物类型</th>
                        <th>
                            <span style="margin-right: 25px;">操作</span>
                            <input id="toExcel" type="button" class="am-btn am-btn-xs am-btn-success" value="导出Excel"/>
                        </th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="food" items="${pageList.list}" varStatus="status">
                        <tr>
                            <td><input type="checkbox" name="item" value="${food.id}"/></td>
                            <td>${(pageList.pageNumber - 1) * pageList.pageSize +status.count}</td>
                            <td>${food.foodName}</td>
                            <td><span class="am-icon-jpy">&nbsp;</span>${food.price}</td>
                            <td><a href="${ctx}/${food.image}" target="_blank"><img class="smallImg" src="${ctx}/${food.image}"></a></td>
                            <td>${food.description}</td>
                            <td>${food.foodTypeId}</td>
                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <button class="am-btn am-btn-default am-btn-xs am-text-secondary edit"
                                                data-am-modal="{target: '#edit-modal'}" data-id="${food.id}"><span
                                                class="am-icon-pencil-square-o"></span> 编辑
                                        </button>
                                        <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only del doc-confirm-toggle"
                                                data-id="${food.id}"><span class="am-icon-trash-o"></span> 删除
                                        </button>
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
                        <div class="no-data-font">对不起，没有查询到相关的商品信息</div>
                    </div>
                </c:if>
                    <tags:pagination page="${pageList}"/>
                </div>
                <hr/>
                <input type="hidden" id="delId" value=""/>
                <input type="hidden" id="nullData" data-am-modal="{target: '#nullData-modal', closeViaDimmer: 0, width: 300, height: 130}"/>
            </div>
        </div>
    </div>
    </div>
</form>

<jsp:include page="../modal/menuModal.jsp"/>

<content tag="script">
    <script src="${ctx}/resources/jquery-Upload/js/fileinput.js" type="text/javascript"></script>
    <script src="${ctx}/resources/jquery-Upload/js/fileinput_locale_zh.js" type="text/javascript"></script>
    <script src="${ctx}/resources/js/back/manageMenuData.js" type="text/javascript"></script>
    <script src="${ctx}/resources/js/back/batchOperation.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            BatchOperation.init("items", "item");
            ManageMenuData.init();
        })
    </script>
</content>
</body>
</html>
