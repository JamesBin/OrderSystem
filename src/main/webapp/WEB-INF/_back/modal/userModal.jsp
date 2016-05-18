<%--用户管理Modal--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
    <div class="am-modal-dialog">
        <div class="am-modal-bd">
            你，确定要删除这条记录吗？
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-cancel>取消</span>
            <span class="am-modal-btn confirmDel" data-am-modal-confirm>确定</span>
        </div>
    </div>
</div>

<div class="am-modal am-modal-alert" tabindex="-1" id="add-modal" >
    <div class="am-modal-dialog"  >
        <form class="am-form am-form-horizontal"  action="${ctx}/back/saveUser" method="post" >
            <div class="am-modal-bd">
                <div class="am-form-group am-cf">
                    <span class="am-u-sm-5 addProductTitle"><span class="am-icon-user-plus"></span> 添加用户信息</span>
                    <div class="am-u-sm-7">
                        <a href="#" class="am-close am-close-alt am-close-spin am-icon-times am-fr closeModal"></a>
                    </div>
                </div>
                <hr data-am-widget="divider"  class="am-divider am-divider-default" />

                <div class="formPanel">

                    <div class="am-form-group">
                        <label for="username" class="am-u-sm-3 am-form-label">用户名</label>
                        <div class="am-u-sm-9">
                            <input type="text" id="username" name="user.username" placeholder="输入你的用户名" required>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="password" class="am-u-sm-3 am-form-label">密码</label>
                        <div class="am-u-sm-9">
                            <input type="password" id="password" name="user.password" placeholder="输入密码" required>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="confirmPass" class="am-u-sm-3 am-form-label">确认密码</label>
                        <div class="am-u-sm-9">
                            <input type="password" id="confirmPass" name="user.password" placeholder="确认密码" required>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="mobile" class="am-u-sm-3 am-form-label">联系电话</label>
                        <div class="am-u-sm-9">
                            <input type="text" id="mobile"  name="user.mobile" placeholder="输入手机号码" required>
                        </div>
                    </div>


                    <div class="am-form-group">
                        <label for="address" class="am-u-sm-3 am-form-label">地址</label>
                        <div class="am-u-sm-9">
                            <textarea id="address" name="user.address"  placeholder="联系地址 ..." required></textarea>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="remark" class="am-u-sm-3 am-form-label">备注</label>
                        <div class="am-u-sm-9">
                            <textarea id="remark" name="user.address"  placeholder="备注 ..." required></textarea>
                        </div>
                    </div>
                    <input type="hidden" name="user.roleId" value="2"/>
                </div>
            </div>

            <div class="am-modal-footer modalFooter" >
                    <div class="am-u-sm-6 paddingZero">
                        <button type="submit" class="am-btn am-btn-default footerBtn" ><span class="am-icon-save">&nbsp;</span>保存</button>
                    </div>
                    <div class="am-u-sm-6 paddingZero" >
                        <a class="am-btn am-btn-default cancel footerBtn"  data-am-modal-cancel><span class="am-icon-undo">&nbsp;</span>取消</a>
                    </div>
            </div>
        </form>
    </div>
</div>

<div class="am-modal am-modal-alert" tabindex="-1" id="edit-modal" >
    <div class="am-modal-dialog">
        <form class="am-form am-form-horizontal" action="${ctx}/back/editUser" method="post">
            <div class="am-modal-bd">
                <div class="am-form-group am-cf">
                    <span class="am-u-sm-5 modalTitle"><span class="am-icon-edit">&nbsp;</span>修改用户信息</span>

                    <div class="am-u-sm-7">
                        <a href="#" class="am-close am-close-alt am-close-spin am-icon-times am-fr cancel"></a>
                    </div>
                </div>
                <hr data-am-widget="divider" style="" class="am-divider am-divider-default"/>

                <div class="formPanel">

                    <div class="am-form-group">
                        <label for="editUsername" class="am-u-sm-3 am-form-label">用户名</label>
                        <div class="am-u-sm-9">
                            <input type="text" id="editUsername" name="user.username" placeholder="输入你的用户名" />
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="editMobile" class="am-u-sm-3 am-form-label">联系电话</label>
                        <div class="am-u-sm-9">
                            <input type="text" id="editMobile"  name="user.mobile" placeholder="输入手机号码" required />
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="editAddress" class="am-u-sm-3 am-form-label">地址</label>
                        <div class="am-u-sm-9">
                            <textarea id="editAddress" name="user.address"  placeholder="联系地址 ..." required ></textarea>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="editRemark" class="am-u-sm-3 am-form-label">备注</label>
                        <div class="am-u-sm-9">
                            <textarea id="editRemark" name="user.remark"  placeholder="备注" required ></textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="am-modal-footer modalFooter">
                <div class="am-u-sm-6 paddingZero">
                    <button type="submit" class="am-btn am-btn-default footerBtn"><span class="am-icon-save">&nbsp;</span>保存</button>
                </div>
                <div class="am-u-sm-6 paddingZero">
                    <a class="am-btn am-btn-default cancel footerBtn"><span class="am-icon-undo">&nbsp;</span>取消</a>
                </div>
            </div>
            <input type="hidden" name="user.id" id="editId" value=""/>
        </form>
    </div>
</div>


<%--删除项为空时弹出Modal--%>
<div class="am-modal am-modal-alert" tabindex="-1" id="nullData-modal">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">提示:</div>
        <div class="am-modal-bd tips"></div>
        <div class="am-modal-footer">
            <span class="am-modal-btn">确定</span>
        </div>
    </div>
</div>