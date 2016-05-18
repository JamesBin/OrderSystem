package com.util;

/**
 * Created by 詹武槟 on 2016/2/26.
 */
public class Constant {

    public final static String SQL_ORDER_STORE = "select so.id as orderId ,st.id as storeId,so.arriveDate,so.createDate,so.orderNo,so.total,so.userId,so.`status`,st.storeName";
}
