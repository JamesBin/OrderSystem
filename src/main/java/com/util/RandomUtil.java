package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 詹武槟 on 2016/1/16.
 */
public class RandomUtil {
    private static final String ORDER_PREFIX = "D-";         //订单号前缀
    private static final String PAY_PREFIX = "P-";           //支付号前缀
    private static final String DATE_FORMAT = "yyyyMMdd";    //默认的日期位数

    public static String dateFormat() {
        SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
        return sdf.format(new Date());
    }

    public static String replaceDayNum(String count) {
        int length = count.length();
        if( length == 1) {
            return "000" + count;
        } else if( length == 2) {
            return "00" + count;
        } else if( length == 3) {
            return "0" + count;
        } else {
            return count;
        }
    }

    public static String orderNo(String count) {
        return  ORDER_PREFIX + dateFormat() + replaceDayNum(count);
    }

    public static String paymentNo(String count) {

        return PAY_PREFIX + dateFormat() + replaceDayNum(count);
    }

    public static void main(String args[]) {
        System.out.println(orderNo(""));
    }
}
