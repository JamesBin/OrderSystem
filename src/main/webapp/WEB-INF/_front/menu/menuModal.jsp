<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--head上方点击电话图标时触发--%>
<div class="am-modal am-modal-alert" tabindex="-1" id="phone-modal">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">黄小吉</div>
        <div class="am-modal-bd">商家电话：020-88228222</div>
        <div class="am-modal-footer">
            <span class="am-modal-btn">确定</span>
        </div>
    </div>
</div>

<%--购物车数量为空时触发--%>
<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">温馨提示：</div>
        <div class="am-modal-bd">
            尊敬的顾客，您的购物车还是空的哦，请先挑选美食^_^
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn">确定</span>
        </div>
    </div>
</div>

<%--订单信息为空时触发--%>
<div class="am-modal am-modal-alert" tabindex="-1" id="orderInfoNull-alert">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">温馨提示：</div>
        <div class="am-modal-bd tips">
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn">确定</span>
        </div>
    </div>
</div>


<%--
<div class="am-modal am-modal-alert" tabindex="-1" id="userLogin-modal" style="padding: 10px;">
    <div class="am-modal-dialog">
        <div class="am-u-sm-12" style="background-color: white;padding: 5px;">
        <div style="font-size:16px !important;text-align:left;margin-bottom: 10px;"><span class="am-icon-user">&nbsp;</span><label>用户登录</label></div>

        <form class="am-form am-form-horizontal" action="${ctx}/user/login" method="post">
            <div class="am-input-group am-input-group-warning" style="margin-bottom: 10px;">
                <span class="am-input-group-label"><i class="am-icon-user am-icon-fw"></i></span>
                <input type="text" class="am-form-field" placeholder="用户名">
            </div>

            <div class="am-input-group am-input-group-warning" style="margin-bottom: 10px;">
                <span class="am-input-group-label"><i class="am-icon-lock am-icon-fw"></i></span>
                <input type="text" class="am-form-field" placeholder="密码">
            </div>


            <div class="am-input-group">
                <div class="am-u-sm-6  am-fl" style="padding: 0">
                    <button class="am-btn am-btn-success">登录</button>
                </div>
                <div class="am-u-sm-6 am-fr" style="padding: 0">
                    <button class="am-btn am-btn-default back ">返回</button>
                </div>
            </div>

            &lt;%&ndash;<div class="am-modal-bd">
                <div class="am-form-group am-cf">
                    <span class="am-u-sm-5 modalTitle"><span class="am-icon-user am-icon-sm">&nbsp;</span>用户登录</span>

                    <div class="am-u-sm-7">
                        <a href="#" class="am-close am-close-alt am-close-spin am-icon-times am-fr cancel"></a>
                    </div>
                </div>

                <hr data-am-widget="divider" style="" class="am-divider am-divider-default"/>

                    <div class="am-form-group" style="margin-bottom: 10px !important;">
                        <label for="username" class="am-u-sm-4 am-form-label "  style="padding-top: 5px !important;">用户名</label>
                        <div class="am-u-sm-8 paddingZero">
                            <input type="text" name="user.username" id="username" placeholder="输入你的用户名" required>
                        </div>
                    </div>

                    <div class="am-form-group" >
                        <label for="password" class="am-u-sm-4 am-form-label" style="padding-top: 15px !important;">密码</label>
                        <div class="am-u-sm-8 paddingZero">
                            <input type="password" id="password"  name="user.password" placeholder="输入密码" required />
                        </div>
                    </div>
                </div><p/>

            <div class="am-modal-footer"  style="margin-top: 15px !important;padding-bottom: 0px !important;">
                <div class="am-u-sm-6" style="padding: 0 !important;">
                    <button type="submit" class="am-btn am-btn-success" style="width: 135px;"><span class="am-icon-save">&nbsp;</span>登录</button>
                </div>
                <div class="am-u-sm-6" style="padding: 0 !important;">
                    <a class="am-btn am-btn-default am-btn-warning cancel"  style="width: 135px"><span class="am-icon-undo">&nbsp;</span>返回</a>
                </div>
            </div>
            <input type="hidden" name="user.id" id="editId" value=""/>&ndash;%&gt;
        </form>
        </div>
    </div>
</div>--%>
