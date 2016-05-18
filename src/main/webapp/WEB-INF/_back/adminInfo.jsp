<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js">
<head>
    <title>后台管理系统</title>
</head>
<body>
<!-- content start -->
<div class="admin-content">
    <div class="am-cf am-padding">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal information</small></div>
    </div>

    <hr/>

    <div class="am-g">

        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
            <div class="am-panel am-panel-default">
                <div class="am-panel-bd">
                    <div class="am-g">
                        <div class="am-u-md-4">
                            <img class="am-img-circle am-img-thumbnail" src="${ctx}/resources/img/head.jpg" alt="管理员头像"/>
                        </div>
                        <div class="am-u-md-8">
                            <p>你可以使用<a href="#">gravatar.com</a>提供的头像或者使用本地上传头像。 </p>
                            <form class="am-form">
                                <div class="am-form-group">
                                    <input type="file" id="user-pic">
                                    <p class="am-form-help">请选择要上传的文件...</p>
                                    <button type="button" class="am-btn am-btn-success am-btn-xs">修改密码</button>
                                    <button type="button" class="am-btn am-btn-primary am-btn-xs">保存</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="am-panel am-panel-default">
                <div class="am-panel-bd">
                    <div class="user-info">
                        <p>等级信息</p>
                        <div class="am-progress am-progress-sm">
                            <div class="am-progress-bar" style="width: 60%"></div>
                        </div>
                        <p class="user-info-order">当前等级：<strong>LV8</strong> 活跃天数：<strong>587</strong> 距离下一级别：<strong>160</strong></p>
                    </div>
                    <div class="user-info">
                        <p>信用信息</p>
                        <div class="am-progress am-progress-sm">
                            <div class="am-progress-bar am-progress-bar-success" style="width: 80%"></div>
                        </div>
                        <p class="user-info-order">信用等级：正常当前 信用积分：<strong>80</strong></p>
                    </div>
                </div>
            </div>

        </div>

        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
            <form class="am-form am-form-horizontal" id="adminForm">
                <div class="am-form-group">
                    <label for="user-name" class="am-u-sm-3 am-form-label">姓名 / Name</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="user-name" name="admin.username" placeholder="姓名 / Name" value="${admin.username}">
                    </div>
                </div>

                <div class="am-form-group">
                    <label for="user-email" class="am-u-sm-3 am-form-label">电子邮件 / Email</label>
                    <div class="am-u-sm-9">
                        <input type="email" id="user-email" placeholder="输入你的电子邮件 / Email">
                    </div>
                </div>

                <div class="am-form-group">
                    <label for="user-phone" class="am-u-sm-3 am-form-label">电话 / Telephone</label>
                    <div class="am-u-sm-9">
                        <input type="text" name="admin.mobile" id="user-phone" placeholder="输入你的电话号码 / Telephone" value="${admin.mobile}">
                    </div>
                </div>

                <div class="am-form-group">
                    <label for="user-QQ" class="am-u-sm-3 am-form-label">QQ</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="user-QQ" placeholder="输入你的QQ号码">
                    </div>
                </div>

                <div class="am-form-group">
                    <label for="user-weibo" class="am-u-sm-3 am-form-label">微博 / Twitter</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="user-weibo" placeholder="输入你的微博 / Twitter">
                    </div>
                </div>

                <div class="am-form-group">
                    <label for="user-intro" class="am-u-sm-3 am-form-label">简介 / Intro</label>
                    <div class="am-u-sm-9">
                        <textarea class="" name="admin.remark" rows="5" id="user-intro" placeholder="输入个人简介">${admin.remark}</textarea>
                    </div>
                </div>

                <div class="am-form-group">
                    <div class="am-u-sm-9 am-u-sm-push-3">
                        <button type="button" class="save am-btn am-btn-primary">保存修改</button>
                    </div>
                </div>
                <input type="hidden"  name="admin.id"  value="${admin.id}">
            </form>
        </div>
    </div>
</div>

</div>

<input type="hidden" id="systemTips" data-am-modal="{target: '#system-modal', closeViaDimmer: 0, width: 300, height: 130}"/>
<div class="am-modal am-modal-alert" tabindex="-1" id="system-modal">
    <div class="am-modal-dialog">
        <div class="am-modal-hd"><span class="am-icon-check-circle-o">&nbsp;</span>系统提示</div>
        <div class="am-modal-bd tips"></div>
        <div class="am-modal-footer">
            <span class="am-modal-btn">确定</span>
        </div>
    </div>
</div>

<!-- content end -->

<content tag="script">
    <script>
        $('.save').on('click', function () {
            $.ajax({
               url : '../back/editAdminInfo' ,
               method : 'POST',
               data: $('#adminForm').serialize(),
               success: function (data) {
                   $('.tips').html("编辑成功!");
                   $('#systemTips').click();
               } ,
               error : function () {
                   alert('请求提交失败，请检查当前网络状况');
               }
            });

          /*  $.ajax('../back/editAdminInfo', $('#adminForm').serialize(), function (reap) {
                alert('编辑成功');
            });*/
        });
    </script>
</content>
</body>
</html>
