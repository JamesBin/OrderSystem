<%--订单管理Modal--%>
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

<div class="am-modal am-modal-alert" tabindex="-1" id="add-modal">
    <div class="am-modal-dialog"  >
        <form class="am-form am-form-horizontal"  action="${ctx}/back/saveUser" method="post" >
            <div class="am-modal-bd">
                <div class="am-form-group am-cf">
                    <span class="am-u-sm-5 addProductTitle"><span class="am-icon-user-plus"></span> 添加订单信息</span>
                    <div class="am-u-sm-7">
                        <a href="#" class="am-close am-close-alt am-close-spin am-icon-times am-fr closeModal"></a>
                    </div>
                </div>
                <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />


                <div class="formPanel">

                    <div class="am-form-group">
                        <label for="foodName" class="am-u-sm-3 am-form-label">用户名</label>
                        <div class="am-u-sm-9">
                            <input type="text" class="required" id="foodName" name="food.foodName" placeholder="输入你的用户名">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="price" class="am-u-sm-3 am-form-label">密码</label>
                        <div class="am-u-sm-9">
                            <input type="text" class="required" id="price" name="food.price" placeholder="输入密码">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="price" class="am-u-sm-3 am-form-label">联系电话</label>
                        <div class="am-u-sm-9">
                            <input type="text" class="required"  name="food.price" placeholder="输入密码">
                        </div>
                    </div>


                    <div class="am-form-group">
                        <label for="description" class="am-u-sm-3 am-form-label">地址</label>
                        <div class="am-u-sm-9">
                            <textarea id="description" name="food.description"  placeholder="联系地址 ..."></textarea>
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
        </form>
    </div>
</div>

<div class="am-modal am-modal-alert" tabindex="-1" id="edit-modal">
    <div class="am-modal-dialog">
        <form class="am-form am-form-horizontal" action="${ctx}/back/editOrder" method="post">
            <div class="am-modal-bd">
                <div class="am-form-group am-cf">
                    <span class="am-u-sm-5 addProductTitle"><span class="am-icon-edit">&nbsp;</span>修改订单信息</span>

                    <div class="am-u-sm-7">
                        <a href="#" class="am-close am-close-alt am-close-spin am-icon-times am-fr cancel"></a>
                    </div>
                </div>
                <hr data-am-widget="divider" style="" class="am-divider am-divider-default"/>

                <div class="formPanel">
                    <div class="am-form-group">
                        <label for="editTotal" class="am-u-sm-3 am-form-label">订单总额</label>
                        <div class="am-u-sm-9">
                            <input type="text"  id="editTotal" name="order.total" required>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label  class="am-u-sm-3 am-form-label">所属门店</label>
                        <div class="am-u-sm-9">
                            <select id="editStoreId" data-am-selected="{btnWidth: '100%', btnSize: 'sm', btnStyle: 'default'}" class="am-u-sm-9"  name="order.storeId">
                            </select>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">订单来源</label>
                        <div class="am-u-sm-9 am-text-left am-text-left">
                            <select data-am-selected="{btnWidth: '100%', btnSize: 'sm', btnStyle: 'default'}" class="am-u-sm-9"name="order.source">
                                  <option value="0">微信平台</option>
                                  <option value="1">电话订单</option>
                                  <option value="2">饿了么</option>
                                  <option value="3">百度外卖</option>
                                  <option value="4">美团外卖</option>
                            </select>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label  class="am-u-sm-3 am-form-label">订单状态</label>
                        <div class="am-u-sm-9 am-text-left">
                            <select data-am-selected="{btnWidth: '100%', btnSize: 'sm', btnStyle: 'default'}" class="am-u-sm-9"  name="order.status">
                                <option value="-1" >未支付</option>
                                <option value="0">待支付</option>
                                <option value="1">已支付</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <div class="am-modal-footer modalFooter">
                <div class="am-u-sm-6 paddingZero">
                    <button type="submit" class="am-btn am-btn-default footerBtn"><span class="am-icon-save">&nbsp;</span>保存</button>
                </div>
                <div class="am-u-sm-6 paddingZero">
                    <a class="am-btn am-btn-default cancel footerBtn" data-am-modal-cancel><span class="am-icon-undo">&nbsp;</span>取消</a>
                </div>
            </div>

            <input type="hidden" name="order.id" id="editId" value=""/>
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