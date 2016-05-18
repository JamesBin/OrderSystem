<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>
<html>
<head>
    <content tag="css">
        <link rel="stylesheet" href="${ctx}/resources/css/lanren.css"/>
    </content>

</head>
<body>
<div class="header">
    <div class="all_w ">
        <div class="ttwenz">
            <h4><span class="am-icom-arrow-left am-fl">&nbsp;</span>确认交易</h4>
            <%--<h5>微信安全支付</h5>--%>
        </div>
    </div>
</div>
<div class="wenx_xx">
    <div class="mz">黄小吉餐饮</div>
    <div class="wxzf_price">￥${amount}</div>
</div>
<div class="skf_xinf">
    <div class="all_w"><span class="bt">收款方</span> <span class="fr">黄小吉</span></div>
</div>
<a href="javascript:void(0);" class="ljzf_but all_w">立即支付</a>

<!--浮动层-->
<div class="ftc_wzsf">
    <div class="srzfmm_box">
        <div class="qsrzfmm_bt clear_wl"><img src="${ctx}/resources/img/pay/xx_03.jpg" class="tx close fl">
            <img src="${headimgurl}" class="tx fl"><span
                class="fl">请输入支付密码</span></div>
        <div class="zfmmxx_shop">
            <div class="mz">黄小吉餐饮</div>
            <div class="wxzf_price">￥${amount}</div>
        </div>
        <a href="#" class="blank_yh"> <img src="${ctx}/resources/img/pay/coin.png" class="fl"><span class="fl ml5">零钱</span>
            <img src="${ctx}/resources/img/pay/jftc_09.jpg" class="fr"></a>
        <ul class="mm_box">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
    <div class="numb_box">
        <div class="xiaq_tb"><img src="${ctx}/resources/img/pay/jftc_14.jpg" height="10"></div>
        <ul class="nub_ggg" style="padding:0px;">
            <li><a href="javascript:void(0);" style="font-size: 24px">1</a></li>
            <li><a href="javascript:void(0);" class="zj_x" style="font-size: 24px">2</a></li>
            <li><a href="javascript:void(0);" style="font-size: 24px">3</a></li>
            <li><a href="javascript:void(0);" style="font-size: 24px">4</a></li>
            <li><a href="javascript:void(0);" class="zj_x" style="font-size: 24px">5</a></li>
            <li><a href="javascript:void(0);" style="font-size: 24px">6</a></li>
            <li><a href="javascript:void(0);" style="font-size: 24px">7</a></li>
            <li><a href="javascript:void(0);" class="zj_x" style="font-size: 24px">8</a></li>
            <li><a href="javascript:void(0);" style="font-size: 24px">9</a></li>
            <li><span></span></li>
            <li><a href="javascript:void(0);" class="zj_x" style="font-size: 24px">0</a></li>
            <li><span class="del" > <img src="${ctx}/resources/img/pay/jftc_18.jpg"></span></li>
        </ul>
    </div>
    <div class="hbbj"></div>
    <input type="hidden" value="${orderId}" name="orderId">
    <input type="hidden" value="${amount}"  name="amount">
</div>

<content tag="script">
    <script type="text/javascript">
        $(function () {
            var orderId = $('[name = "orderId"]').val();
            var amount = $('[name = "amount"]').val();
            var i = 0;
            $(".nub_ggg li a").click(function () {
                i++
                if (i < 6) {
                    $(".mm_box li").eq(i - 1).addClass("mmdd");
                } else {
                    $(".mm_box li").eq(i - 1).addClass("mmdd");
                    setTimeout(function () {
                        location.href = "${ctx}/pay/payConfirm?orderId="+orderId+"&amount=" + amount;
                    }, 500);
                }
            });

            $(".nub_ggg li .del").click(function () {
                if (i > 0) {
                    i--
                    $(".mm_box li").eq(i).removeClass("mmdd");
                    i == 0;
                }
            });
        });

        //出现浮动层
        $(".ljzf_but").click(function () {
            $(".ftc_wzsf").show();
        });

        //关闭浮动
        $(".close").click(function () {
            $(".ftc_wzsf").hide();
        });

        //数字显示隐藏
        $(".xiaq_tb").click(function () {
            $(".numb_box").slideUp(500);
        });
        $(".mm_box").click(function () {
            $(".numb_box").slideDown(500);
        });
    </script>
</content>
</body>
</html>
