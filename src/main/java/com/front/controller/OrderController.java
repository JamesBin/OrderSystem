package com.front.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.front.model.Comment;
import com.front.model.SaleOrder;
import com.front.model.SaleOrderItem;
import com.front.model.User;
import com.jfinal.plugin.activerecord.Db;
import com.util.DateUtil;
import com.util.RandomUtil;
import com.jfinal.core.Controller;

import java.text.ParseException;
import java.util.List;

public class OrderController extends Controller {

    public void index() throws ParseException {
            redirect("/menu");
    }

    public void saveOrder() {
        String size = getPara("size");
        String area = getPara("area");
        String addr = getPara("address");
        String mobile = getPara("mobile");

        User user = getSessionAttr("user");
        Db.update("update user set area = ?,address = ?,mobile = ? where id = ?", area, addr, mobile, user.getInt("id"));

        List<SaleOrder> saleOrderList = getModel(SaleOrder.class).find("select * from saleorder");
        SaleOrder saleOrder = getModel(SaleOrder.class, "order");
        saleOrder.set("orderNo", RandomUtil.orderNo(saleOrderList.size() + 1 + ""));
        saleOrder.set("createDate", DateUtil.nowDayTime());
        saleOrder.set("userId", user.getInt("id"));
        saleOrder.set("status", -1);                    //订单状态(-1)：未支付
        saleOrder.set("source", 0);                     //订单来源(0)：微信平台
        saleOrder.save();

        Integer orderId = saleOrder.getInt("id");
        Double total = saleOrder.getDouble("total");

        for (int i = 1; i <= Integer.parseInt(size); i++) {
            SaleOrderItem saleOrderItem = getModel(SaleOrderItem.class, "saleOrderItem_" + i);
            if (saleOrderItem.getInt("quantity") == 0) {
                continue;
            } else {
                saleOrderItem.set("orderId", orderId).save();
            }
        }

        redirect("/pay/makeNewPay?orderId=" + orderId + "&amount=" + total, true);
    }

    public void historyOrder() {
        User user = getSessionAttr("user");
        List<SaleOrder> saleOrderList = getModel(SaleOrder.class).find("select * from saleorder where userId = ? order by status ASC,createDate DESC", user.getInt("id"));
        setAttr("saleOrderList", saleOrderList);
        renderJsp("historyOrder.jsp");
    }

    public void ajaxGetHistoryOrderItem() {
        User user = getSessionAttr("user");
        List<SaleOrder> saleOrderList = getModel(SaleOrder.class).find("select id from saleorder where userId = ? order by status ASC,createDate DESC", user.getInt("id"));
        JSONArray orderItemArray = new JSONArray();
        JSONArray commentArray = new JSONArray();
        for(SaleOrder s : saleOrderList) {
            List<SaleOrderItem> saleOrderItemList = getModel(SaleOrderItem.class).find("select s.orderId,s.price,s.quantity,f.foodName from saleorderitem s LEFT JOIN food f on s.foodId=f.id where s.orderId=?", s.getInt("id"));
            List<Comment> commentList = getModel(Comment.class).find("select * from comment where orderId = ?", s.getInt("id"));
            for (SaleOrderItem item : saleOrderItemList) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("orderId", item.getInt("orderId"));
                jsonObject.put("price", item.getDouble("price"));
                jsonObject.put("quantity", item.getInt("quantity"));
                jsonObject.put("foodName", item.getStr("foodName"));
                orderItemArray.add(jsonObject);
            }

            for (Comment c : commentList) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("id", c.getInt("id"));
                jsonObject.put("orderId", c.getInt("orderId"));
                jsonObject.put("grade", c.getInt("grade"));
                jsonObject.put("comment", c.getStr("comment"));
                jsonObject.put("reply", c.getStr("reply"));
                jsonObject.put("status", c.getInt("status"));
                commentArray.add(jsonObject);
            }
        }
        setAttr("data", orderItemArray.toJSONString());
        setAttr("comment", commentArray.toJSONString());
        renderJson();
    }

    public void test() {
        User user = getModel(User.class, "user");
        System.out.print(user.getStr("username"));
        renderJsp("order/redirect.jsp");
    }
}
