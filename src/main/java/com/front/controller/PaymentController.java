package com.front.controller;

import com.front.model.Comment;
import com.front.model.Payment;
import com.front.model.User;
import com.jfinal.plugin.activerecord.Db;
import com.util.DateUtil;
import com.util.RandomUtil;

import java.util.List;

public class PaymentController extends BaseController{

    public PaymentController() {
        setClazz(PaymentController.class);
    }

	public void index() {
		renderJsp("menu.jsp");
	}

    public void makeNewPay() {
         String orderId = getPara("orderId");
         String amount = getPara("amount");
         Db.update("update saleorder set status = 0 where id = ?", orderId);  //订单状态(0)：待支付
         setAttr("amount", amount);
         setAttr("orderId", orderId);
         renderJsp("payment.jsp");
    }

    public void payConfirm() {
        String orderId = getPara("orderId");
        String amount = getPara("amount");

        List<Payment> paymentList = getModel(Payment.class).find("select * from payment");
        Payment payment = getModel(Payment.class);
        payment.set("paymentNo", RandomUtil.paymentNo(paymentList.size() + 1 + ""))
                .set("paymentDate", DateUtil.nowDayTime())
                .set("orderId", orderId)
                .set("amount", amount)
                .set("paymentMethod", "微信钱包")
                .save();

        Db.update("update saleorder set status = 1 where id = ?", orderId);  //订单状态(1)：已支付

        User user = getSessionAttr("user");
        getModel(Comment.class)
                .set("userId", user.getInt("id"))
                .set("orderId", orderId)
                .set("grade", 0)                                             //评分初始值为：0
                .set("status", 0)                                            //评论状态（0）：未评论
                .save();

        setAttr("payment", payment);
        renderJsp("paySuccess.jsp");
    }
}
