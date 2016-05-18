<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="am-g orderInfo" style="margin-top: 10px;overflow-y: scroll">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <h3><a class="am-btn am-btn-sm am-btn-warning back"><span class="am-icon-angle-double-left">&nbsp;</span>返回</a>
            <a href="${ctx}/user" class="am-btn am-btn-sm am-btn-success am-fr"><span
                    class="am-icon-user">&nbsp;</span>登录/注册</a>
        </h3>

        <table class="am-table menuList">
            <tr class="countTotal">
                <td style="font-weight: bold">合计</td>
                <td class="totalMoney"></td>
                <td></td>
            </tr>
        </table>

        <span for="phone">联系电话:</span>
        <input type="text" class="am-form-field" name="user.mobile" id="phone" placeholder="你电话多少?"
              style="margin-bottom: 10px;" required/>
        <input type="text" class="am-form-field" name="user.address" id="address" placeholder="请输入你的地址"
               style="margin-bottom: 10px;"  required/>

        <span for="sendTime">选择配送时间:</span>
        <select class="sendTime" data-am-selected="{btnWidth: '100%'}" name="order.arriveTime">
            <option value="10:00 - 10:30">10:00 - 10:30</option>
            <option value="10:30 - 11:00">10:30 - 11:00</option>
            <option value="11:00 - 11:30">11:00 - 11:30</option>
            <option value="11:30 - 12:00">11:30 - 12:00</option>
            <option value="12:30 - 13:00">12:30 - 13:00</option>
            <option value="尽快配送">尽快配送</option>
        </select><p/>

        <span for="message" >留言叮嘱:</span>
        <select id="message" multiple data-am-selected="{btnWidth: '100%'}" name="user.remark"
                placeholder="有什么特殊需求吗？">
            <option value="多加饭">多加饭</option>
            <option value="没零钱">没零钱</option>
            <option value="微辣">微辣</option>
            <option value="中辣">中辣</option>
            <option value="不辣">不辣</option>
        </select><p/>

        <center>(资料填写完整才能下单哦！)</center>
        <hr data-am-widget="divider" style="" class="am-divider am-divider-default"/>
    </div>
</div>