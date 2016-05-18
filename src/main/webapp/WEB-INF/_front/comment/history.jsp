<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/_front/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,user-scalable=no"/>
	<title>历史订单</title>
    <link rel="stylesheet" href="${ctx}/resources/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${ctx}/resources/css/decorator.css"/>
    <script src="${ctx}/resources/assets/js/jquery.min.js"></script>
</head>

<body>
    <header data-am-widget="header"
            class="am-header am-header-default" style="background-color: #5ABA5C !important;">
        <div class="am-header-left am-header-nav">
            <a href="${ctx}/" class="">
                <i class="am-header-icon am-icon-home"></i>
            </a>
            <a href="#phone-link" class=""
               data-am-modal="{target: '#phone-modal', closeViaDimmer: 0, width: 300, height: 130}">
                <i class="am-header-icon am-icon-phone"></i>
            </a>
        </div>
        <h1 class="am-header-title"><span class="titleTips">订单评价&nbsp;<span class="am-icon-commenting-o am-icon-sm"></span></span></h1>

        <div class="am-header-right am-header-nav">
            <a href="#user-link" class="">
                <i class="am-header-icon am-icon-user"></i>
            </a>
            <a href="#cart-link" class="">
                <i class="am-header-icon am-icon-shopping-cart"></i>
            </a>
        </div>
    </header>

	<div class="am-g">
	  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">

	    <h2>历史订单</h2>
	    <span>2015-12-28 12:40</span>
	    <table class="am-table">
	      <tr>
	          <td>合计</td>
	          <td>36</td>
	          <td> </td>
	      </tr>
	
	      <tr>
	          <td>猪扒拼茄子饭</td>
	          <td>×2</td>
	          <td> 24</td>
	      </tr>
	
	      <tr>
	          <td>烧鸭饭</td>
	          <td>×1</td>
	          <td> 12</td>
	      </tr>
	    </table>
	
	    <form method="post" class="am-form">
	 
	        <span for="message">评价:</span>
	        <textarea rows="5" placeholder="服务是否满足您的需求？"></textarea> 
	        <br>
	        
	        <button type="submit" class="am-btn  am-btn-sm  am-btn-warning" style="width:100%"> 
	            <span class="am-icon-check-square">&nbsp;</span> 提交评价
	        </button>
	
	         <div style="text-align: center"> 感谢您的惠顾 ~! 欢迎下次点餐</div><br/>
	    </form>
	    <hr>
	    <span class="am-fr">© 2015 By zwb_scau</span>
	  </div>
	</div>

    <jsp:include page="/WEB-INF/_front/common/footer.jsp"/>

</body>
</html>