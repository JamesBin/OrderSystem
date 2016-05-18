<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/_front/common/taglib.jsp" %>
<!DOCTYPE HTML>
<html ng-app>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>选择门店</title>
</head>
<body>
<div class="header">
    <div class="am-g">
        <div class="am-u-sm-12 headerRow">
            <span class="titleTips">黄小吉餐饮</span>
            <span class="am-fr" style="padding-top:5px;"><i class="am-icon-spinner am-icon-spin"></i>${currentLocation}</span>
        </div>
    </div>
</div>

<div class="am-g">
    <div data-am-widget="slider" class="am-slider am-slider-c3" data-am-slider='{&quot;controlNav&quot;:false}'>
        <ul class="am-slides">
            <li>
                <img src="${ctx}/resources/img/20147301261.jpg" height="200px"/>

                <div class="am-slider-desc">
                    <div class="am-slider-counter"><span class="am-active">1</span>/3</div>
                    热销 黄焖鸡米饭
                </div>
            </li>
            <li>
                <img src="${ctx}/resources/img/20147301262.jpg" height="200px"/>

                <div class="am-slider-desc">
                    <div class="am-slider-counter"><span class="am-active">2</span>/3</div>
                    热销 特色猪扒饭
                </div>
            </li>
            <li>
                <img  src="${ctx}/resources/img/20147301263.jpg" height="200px"/>

                <div class="am-slider-desc">
                    <div class="am-slider-counter"><span class="am-active">3</span>/3</div>
                    热销 双拼烧鸭饭
                </div>
            </li>
        </ul>
    </div>

    <div class="am-u-sm-12 storeDiv" style="margin-top: 10px;">
        <c:forEach items="${storeList }" var="store">
            <div class="am-u-sm-6 storePanel" data-id="${store.id}" id="store_${store.id}">
                <p class="storeNameStyle">${store.storeName}</p>
                <p class="addrStyle">${store.address} ...</p>
            </div>
        </c:forEach>
    </div>
</div>
<p/>

<jsp:include page="/WEB-INF/_front/common/footer.jsp"/>
<input type="hidden" value="${recommendStore}" id="recommend">

<content tag="script">
    <script src="${ctx}/resources/lazyload/amazeui.lazyload.min.js"></script>
    <script>
        $(function () {
            var recommend = $('#recommend').val();
            if (recommend == "" || recommend == null) {
                return;
            }

            var html = $('#store_' + recommend).html();
            $('#store_' + recommend).remove();
            $('.storeDiv').prepend('<div class="am-u-sm-6 storePanel" data-id = "'+ recommend +'" id="store_'+recommend+'" >' + html + "</div>");
            $('#store_' + recommend).prepend("<a class='am-badge am-badge-warning am-fl' style='font-size: 16px;'>最近门店</a>");
            $('#store_' + recommend + ' .storeNameStyle').addClass('nearStoreName');
        });

        $('.storeDiv').on('click', '.storePanel', function () {
            var storeId = $(this).attr('data-id');
            window.location.href = '${ctx}/menu?id=' + storeId;
        });
    </script>
</content>
</body>
</html>