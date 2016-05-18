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


<form class="am-form" id="listForm" method="post" action="${ctx}/back/commentManage">

    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">评论管理</strong> /
                <small>Manage</small>
            </div>
        </div>

        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-6">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <button type="button" class="am-btn am-btn-default" data-am-modal="{target: '#add-modal'}"><span
                                class="am-icon-user-plus"></span> 审核
                        </button>
                        <button type="button" class="am-btn am-btn-default delAll"><span class="am-icon-trash-o"></span> 删除所选项</button>

                    </div>
                </div>
            </div>

            <div class="am-u-sm-12 am-u-md-3 ">
                <div class="am-input-group am-input-group-sm am-fr">
                    <input type="text"  name="searchName" class="am-form-field" placeholder="用户名查询" value="${searchName}">
                </div>
            </div>

            <div class="am-u-sm-12 am-u-md-3 ">
                <div class="am-input-group am-input-group-sm">

                    <input type="text"  name="searchNum" class="am-form-field" placeholder="手机号查询" value="${searchNum}">
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
                        <th>用户ID</th>
                        <th>订单号</th>
                        <th width="20%">用户评论</th>
                        <th>评分</th>
                        <th >评论日期</th>
                        <th width="20%">商家回复</th>
                        <th width="22%">
                            <span>操作</span>
                            <input id="toExcel" type="button" class="am-btn am-btn-xs am-btn-success" style="margin-left: 120px;" value="导出Excel"/>
                        </th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="comment" items="${pageList.list}" varStatus="status">
                        <tr>
                            <td><input type="checkbox" name="item" value="${comment.id}"/></td>
                            <td>${(pageList.pageNumber - 1) * pageList.pageSize + status.count}</td>
                            <td>${comment.userId}</td>
                            <td><a href="${ctx}/back/weiXinOrderManageDetail?orderId=${comment.orderId}" title="点击可跳至订单详情">${comment.orderId}</a></td>
                            <td><c:if test="${empty comment.commentText}">该用户太忙了，还未进行评论</c:if>${comment.commentText}</td>
                            <td>${comment.grade}星</td>
                            <td>${comment.createDate}</td>
                            <td><c:if test="${empty comment.reply}">商家未回复</c:if>${comment.reply}</td>
                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <button class="am-btn am-btn-default am-btn-xs am-text-secondary edit"
                                                data-am-modal="{target: '#edit-modal'}" data-id= ${comment.id}><span
                                                class="am-icon-pencil-square-o"></span> 编辑
                                        </button>

                                        <c:if test="${empty comment.commentText}">
                                            <button class="am-btn am-btn-default am-btn-xs" disabled>
                                                    <span class="am-icon-mail-forward"></span>回复评论
                                            </button>
                                        </c:if>

                                        <c:if test="${!empty comment.commentText}">
                                            <button class="am-btn am-btn-default am-btn-xs am-text-secondary"
                                                    data-id= ${comment.id}><span class="am-icon-mail-forward"></span>回复评论
                                            </button>
                                        </c:if>

                                        <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only del doc-confirm-toggle"
                                                data-id="${comment.id}"><span class="am-icon-trash-o"></span> 删除
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
                        <div class="no-data-font">对不起，没有查询到相关的评论信息</div>
                    </div>
                </c:if>
                    <tags:pagination page="${pageList}"/>
                </div>
                <hr/>
            </div>
        </div>

        <a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
           data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
        <input type="hidden" id="delId" value=""/>
        <input type="hidden" id="nullData" data-am-modal="{target: '#nullData-modal', closeViaDimmer: 0, width: 300, height: 130}"/>
    </div>
    </div>
</form>


<jsp:include page="../modal/commentModal.jsp"/>

</body>

<content tag="script">
    <script src="${ctx}/resources/js/back/manageUserData.js" type="text/javascript"></script>
    <script src="${ctx}/resources/js/back/batchOperation.js" type="text/javascript"></script>
    <script>
        $(function () {
            BatchOperation.init("items", "item");
            ManageUserData.init();
        });
    </script>
</content>
</body>
</html>
