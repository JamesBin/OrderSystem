<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/_front/common/taglib.jsp" %>
<!DOCTYPE HTML>
<html ng-app>
<head>
    <content tag="css">
        <link rel="stylesheet" href="${ctx}/resources/css/front/historyorder.css"/>
    </content>
</head>

<body>
<header data-am-widget="header" class="am-header am-header-default header">
    <div class="am-header-left am-header-nav">
        <a href="${ctx}/store">
            <i class="am-header-icon am-icon-home"></i>
        </a>
    </div>
    <h1 class="am-header-title"><span class="titleTips">历史订单</span></h1>
</header>

<button class="am-btn am-btn-warning am-animation-fade am-btn-block">您有订单还未评论哦，点击评论</button>

<div class="am-g orderPanel" style="display: none">
    <c:if test="${saleOrderList == null}" >
        <span class="nullOrder" style="vertical-align: middle;text-align: center">您还没有历史订单哦，请先下单！</span>
    </c:if>

    <c:forEach items="${saleOrderList}" var="order">
        <div class="am-u-sm-12 rowPadding" style="margin-bottom: 10px">
            <article class="am-comment">
                <a href="#link-to-user-home">
                    <img src="${headimgurl}" class="am-comment-avatar headerImg">
                </a>

                <div class="am-comment-main">
                    <header class="am-comment-hd">
                        <div class="am-comment-meta">
                            <a href="#link-to-user" class="am-comment-author orderInfoColor">订单号：<a
                                    href="#" class="orderInfoColor">${order.orderNo}</a></a>

                            <c:if test="${order.status == 1}"><a
                                    class="am-badge am-badge-success am-radius am-fr btnStyle">已支付</a></c:if>
                            <c:if test="${order.status == 0 || order.status == -1}"><a
                                    class="am-badge am-badge-warning am-radius am-fr btnStyle">待支付</a></c:if>

                            <time datetime="2013-07-27T04:54:29-07:00" class="am-fl orderInfoColor">
                                创建日期： <fmt:formatDate value="${order.createDate}" pattern="YYYY-MM-dd HH:mm:ss"/>
                            </time>
                        </div>
                    </header>

                    <div class="am-comment-bd itemDiv">
                        <table class="am-table am-text-nowrap am-scrollable-horizontal am-table-compact marginBottomFive ${order.id}">
                        </table>

                        <div class="am-g">
                            <div class="am-u-sm-12">
                                <div class="am-fr marginRightTen">合计：<span class="totalMoneyStyle">￥${order.total}</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <footer class="am-comment-footer">
                        <div class="am-comment-actions">
                            <c:choose>
                                <c:when test="${order.status == 0 || order.status == -1}">
                                    <div class="am-g">
                                        <div class="am-u-sm-12">
                                            <button id="cancelOrder" class="am-btn am-btn-default am-btn-sm am-fr"
                                                    data-id="${order.id}" data-total="${order.total}">
                                                <span class="am-icon-trash-o">&nbsp;取消</span>
                                            </button>

                                            <button id="toPay" class="am-btn am-btn-success am-btn-sm am-fr marginRightTen"
                                                    data-id="${order.id}" data-total="${order.total}">
                                                <span class="am-icon-shopping-cart">&nbsp;支付</span>
                                            </button>
                                        </div>
                                    </div>
                                </c:when>

                                <c:otherwise>
                                    <a class="zhan" href="#"><i class="am-icon-thumbs-up">赞</i>(<span>0</span>)</a>
                                    <a href="#"><i class="am-icon-thumbs-down">踩</i></a>
                                    <a href="#" class="toComment" data-orderNo="${order.orderNo}" data-id="${order.id}"
                                       data-commentId=""><i class="am-icon-reply"></i>评论</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </footer>
                </div>
            </article>
        </div>
    </c:forEach>
</div>

<div class="am-g commentPanel comment" style="display: none">
    <div class="am-u-sm-12" style="padding:20px">
        <form class="am-form" method="post" id="commentForm">
            <div class="am-form-group">
                <label class="commentNo"></label>
                <textarea rows="5" id="comment" name="comment.comment" placeholder="请输入您的评价" required="required"></textarea>
            </div>

            <div class="am-form-group">
                <label class="grade am-fl">服务评分:</label>

                <div id="star" class="am-fl marginLeftTen"></div>

                <div class="am-fr">
                    <button class="am-btn am-btn-success am-btn-sm saveComment">提交评价</button>
                    <button class="am-btn am-btn-default am-btn-sm back">返回</button>
                    <input type="hidden" name="comment.orderId" id="orderId" value=""/>
                    <input type="hidden" name="comment.grade" id="grade" value=""/>
                    <input type="hidden" name="comment.id" id="commentId" value=""/>
                </div>
            </div>
        </form>
    </div>
</div>

<input type="hidden" class="alert" data-am-modal="{target: '#commentSuccess-alert'}">
<%--评论成功时触发--%>
<div class="am-modal am-modal-alert" tabindex="-1" id="commentSuccess-alert">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">温馨提示：</div>
        <div class="am-modal-bd tips">
            您的评论已提交！
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn">确定</span>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/_front/common/footer.jsp"/>

<content tag="script">
    <script src="${ctx}/resources/js/front/historyOrder.js"></script>
    <script src="${ctx}/resources/raty/lib/jquery.raty.min.js"></script>
</content>
</body>
</html>