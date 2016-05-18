<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--删除食物Modal--%>
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

<%--修改食物Modal--%>
<div class="am-modal am-modal-alert" tabindex="-1" id="edit-modal">
    <div class="am-modal-dialog">
        <form class="am-form am-form-horizontal" id="editForm" action="${ctx}/back/editFood" method="post"
              enctype="multipart/form-data">
            <div class="am-modal-bd">
                <div class="am-form-group am-cf">
                    <span class="am-u-sm-5 addProductTitle"><span class="am-icon-edit">&nbsp;</span>修改商品信息</span>

                    <div class="am-u-sm-7">
                        <a href="#" class="am-close am-close-alt am-close-spin am-icon-times am-fr cancel"></a>
                    </div>
                </div>
                <hr data-am-widget="divider" style="" class="am-divider am-divider-default"/>

                <div class="formPanel">

                    <div class="am-form-group">
                        <label for="edit_foodName" class="am-u-sm-3 am-form-label">商品名称</label>
                        <div class="am-u-sm-9">
                            <input type="text"  id="edit_foodName" name="food.foodName"
                                   placeholder="输入你的商品名称" required>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="edit_price" class="am-u-sm-3 am-form-label">价格</label>
                        <div class="am-u-sm-9">
                            <input type="text"  id="edit_price" name="food.price" placeholder="输入商品价格" required>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">所属类别</label>
                        <div class="am-u-sm-9 am-text-left">
                            <select data-am-selected="{btnSize: 'sm'}" class="am-u-sm-9" id="edit_foodTypeId" name="food.foodTypeId">
                                <c:forEach items="${foodTypeList}" var="type">
                                    <option value="${type.id}">${type.id}-${type.foodTypeName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="edit_description" class="am-u-sm-3 am-form-label">商品描述</label>
                        <div class="am-u-sm-9">
                            <textarea id="edit_description" name="food.description" placeholder="描述商品特色 ..." required></textarea>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">上传图片</label>
                        <div class="am-u-sm-9 recentImage">
                            <div class="am-u-sm-6 paddingLeftZero"  >
                                <img src="" class="edit_image">
                            </div>
                            <div class="am-u-sm-6 paddingRightZero">
                                <button class="am-btn am-btn-primary changeImage am-fr am-vertical-align-bottom">更换图片</button>
                            </div>
                        </div>

                        <div class="am-u-sm-9 fileUpload">
                            <input id="edit_file-0" name="editImage" class="file" type="file"
                                   data-min-file-count="0">
                            <br>
                        </div>
                    </div>
                </div>
            </div>

            <div class="am-modal-footer modalFooter">

                <div class="am-u-sm-6 paddingZero">
                    <button  class="am-btn am-btn-default editFood footerBtn"><span class="am-icon-save">&nbsp;</span>保存</button>
                </div>
                <div class="am-u-sm-6 paddingZero">
                    <a class="am-btn am-btn-default cancel footerBtn" data-am-modal-cancel><span class="am-icon-undo">&nbsp;</span>取消</a>
                </div>
            </div>
            <input type="hidden" name="food.id" id="edit_id" value=""/>

            <a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
               data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
        </form>
    </div>
</div>

<%--添加食物Modal--%>
<div class="am-modal am-modal-alert" tabindex="-1" id="add-modal" >
    <div class="am-modal-dialog">
        <form class="am-form am-form-horizontal" id="saveForm" action="${ctx}/back/saveFood" method="post"
              enctype="multipart/form-data">
            <div class="am-modal-bd">
                <div class="am-form-group am-cf">
                    <span class="am-u-sm-5 addProductTitle"><span class="am-icon-plus-square">&nbsp;</span>添加商品信息</span>

                    <div class="am-u-sm-7">
                        <a href="#" class="am-close am-close-alt am-close-spin am-icon-times am-fr cancel"></a>
                    </div>
                </div>
                <hr data-am-widget="divider" style="" class="am-divider am-divider-default"/>


                <div class="formPanel" >

                    <div class="am-form-group">
                        <label for="foodName" class="am-u-sm-3 am-form-label">商品名称</label>

                        <div class="am-u-sm-9">
                            <input type="text" id="foodName"  name="food.foodName"
                                   placeholder="输入你的商品名称" required>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="price" class="am-u-sm-3 am-form-label" required>价格</label>

                        <div class="am-u-sm-9">
                            <input type="text" class="required" id="price" name="food.price" placeholder="输入商品价格" required>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">所属类别</label>

                        <div class="am-u-sm-9 am-text-left">
                            <select data-am-selected="{btnSize: 'sm'}" class="am-u-sm-9" name="food.foodTypeId">
                                <c:forEach items="${foodTypeList}" var="type">
                                    <option value="${type.id}">${type.id}-${type.foodTypeName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="description" class="am-u-sm-3 am-form-label">商品描述</label>

                        <div class="am-u-sm-9">
                            <textarea id="description" name="food.description" placeholder="描述商品特色 ..." required></textarea>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">上传图片</label>

                        <div class="am-u-sm-9">
                            <input id="file-0" name="image" class="file" type="file"
                                   data-min-file-count="1" required><br>
                        </div>
                    </div>

                </div>
            </div>

            <div class="am-modal-footer saveFooter modalFooter">
                <div class="am-u-sm-6 paddingZero">
                    <button  class="am-btn am-btn-default saveFood footerBtn"><span class="am-icon-save">&nbsp;</span>保存</button>
                </div>
                <div class="am-u-sm-6 paddingZero">
                    <a class="am-btn am-btn-default cancel footerBtn" data-am-modal-cancel><span class="am-icon-undo">&nbsp;</span>取消</a>
                </div>
            </div>
        </form>
    </div>
</div>

<%--添加食物类型Modal--%>
<div class="am-modal am-modal-alert" tabindex="-1" id="addType-modal">
    <div class="am-modal-dialog">
        <form class="am-form am-form-horizontal" id="saveTypeForm" action="${ctx}/back/saveFoodType" method="post">
            <div class="am-modal-bd">
                <div class="am-form-group am-cf">
                    <span class="am-u-sm-5 modalTitle"><span class="am-icon-plus-square">&nbsp;</span>添加商品类型</span>

                    <div class="am-u-sm-7">
                        <a href="#" class="am-close am-close-alt am-close-spin am-icon-times am-fr cancel"></a>
                    </div>
                </div>
                <hr data-am-widget="divider"  class="am-divider am-divider-default"/>

                <div class="formPanel">

                    <div class="am-form-group">
                        <label for="foodName" class="am-u-sm-3 am-form-label">商品类型</label>

                        <div class="am-u-sm-9">
                            <input type="text" id="foodTypeName"  name="type.foodTypeName"
                                   placeholder="输入你的商品类型名" required>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="typeDesc" class="am-u-sm-3 am-form-label">商品描述</label>

                        <div class="am-u-sm-9">
                            <textarea id="typeDesc" rows="10" name="type.description" placeholder="描述商品特色 ..." required></textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="am-modal-footer saveFooter modalFooter">
                <div class="am-u-sm-6 paddingZero">
                    <button type="submit" class="am-btn am-btn-default saveFoodType footerBtn"><span class="am-icon-save">&nbsp;</span>保存</button>
                </div>
                <div class="am-u-sm-6 paddingZero">
                    <button class="am-btn am-btn-default cancel footerBtn" data-am-modal-cancel><span class="am-icon-undo">&nbsp;</span>取消</button>
                </div>
            </div>
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