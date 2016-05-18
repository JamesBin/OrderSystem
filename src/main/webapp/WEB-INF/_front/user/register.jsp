<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/_front/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,user-scalable=no"/>
    <title>注册界面</title>
    <link rel="stylesheet" href="${ctx}/resources/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${ctx}/resources/css/decorator.css"/>
    <script src="${ctx}/resources/assets/js/jquery.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/_front/common/header.jsp"/>

<div class="am-g">
      <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
          <span class="pageTitle">用户注册</span>
        <hr>

        <form action= "/user/addUser" method="post" class="am-form">
          <span for="username">用户名:</span>
          <input type="text" name="user.username" id="username" placeholder="新用户注册即送优惠红包">
          <br>

          <span for="password">密码:</span>
          <input type="password" name="user.password" id="password" placeholder="新用户注册即送优惠红包">
          <br>

            <span for="phone">联系电话:</span>
            <input type="text" name="user.mobile" id="phone"  placeholder="你电话多少?" required="required" /> <br>
            <span for="phone">配送地址:</span>
            <input type= "text" name="user.address" id="address" placeholder = "请输入你的地址" required="required" /><br>



          <div class="am-cf">
            <input type="submit" value="注 册" class="am-btn am-btn-success am-btn-sm" >
            <a href="javascript:history.back()" class="am-btn am-btn-warning am-btn-sm" style="margin-left:10px;">返回</a>
          </div>
        </form>
      </div>
    </div>

        <hr>
      <center>©Powered by zwb_scau.</center>
      <jsp:include page="/WEB-INF/_front/common/footer.jsp"/>
  </div>
</div>
</body>
</html>