package com.util;

import org.apache.commons.lang3.StringUtils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {

    /**
     * @param plainText（明文）
     * @return 32位密文
     */
    public static String encryption(String plainText) {
        String re_md5 = "";
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(plainText.getBytes());
            byte b[] = md.digest();
            int i;
            StringBuffer buf = new StringBuffer("");

            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
            re_md5 = buf.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return re_md5;
    }

    public static String encryptionUppercase(String plainText) {
        return encryption(plainText).toUpperCase();
    }

    public static String encodeUser(String pwd, String username) {
        if (StringUtils.isNotEmpty(pwd)) {
            return MD5.encryption(pwd
                    + "{"
                    + username
                    + "}");
        }
        return "";
    }

    public static void main(String args []) {
        System.out.println(encryption("test"));
    }
}
