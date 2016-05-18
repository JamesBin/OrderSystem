package com.util;

/**
 * Created by zwb  on 2016/3/8.
 */
public class NumFormatUtil {
    public static Integer strToInt(String str) {
        int len = str.length();                   // 取得字符串的长度
        int index = 0;                            // 预定义第一个非零字符串的位置

        char strs[] = str.toCharArray();          // 将字符串转化成字符数组
        for (int i = 0; i < len; i++) {
            if ('0' != strs[i]) {
                index = i;                        // 找到非零字符串并跳出
                break;
            }
        }
        String strLast = str.substring(index, len);// 截取字符串

        return Integer.parseInt(strLast);
    }
}
