<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>
<html>
<head>
    <title>微信支付成功</title>

    <content tag="css">
        <link rel="stylesheet" href="${ctx}/resources/css/lanren.css"/>
    </content>

</head>
<body>
<div class="header">
    <div class="all_w" style="position:relative; z-index:1;">
        <div class="ttwenz" style=" text-align:center; width:100%;">
            <h4>交易详情</h4>
            <h5>微信安全支付</h5>
        </div>
        <a href="${ctx}/order/historyOrder" class="fh_but">返回</a> </div>
</div>

<div class="zfcg_box ">
    <div class="all_w">
        <img src="${ctx}/resources/img/pay/cg_03.jpg">支付成功</div>

</div>
<div class="cgzf_info">
    <div class="wenx_xx">
        <div class="mz">黄小吉餐饮</div>
        <div class="wxzf_price">￥${payment.amount}</div>
    </div>

    <div class="spxx_shop">
        <div class=" mlr_pm">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>商   品</td>
                    <td align="right">黄焖鸡米饭 1份</td>
                </tr>
                <tr>
                    <td>交易时间</td>
                    <td align="right">${payment.paymentDate}</td>
                </tr>
                <tr>
                    <td>支付方式</td>
                    <td align="right">${payment.paymentMethod}</td>
                </tr>
                <tr>
                    <td>交易单号</td>
                    <td align="right">${payment.paymentNo}</td>
                </tr>
            </table>

        </div>

    </div>
</div>

<div class="wzxfcgde_tb"><img src="${ctx}/resources/img/pay/cg_07.jpg" ></div>
</body>
</html>
