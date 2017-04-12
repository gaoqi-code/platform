package com.hiveview.util;

import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringUtils;

import java.util.Map;
import java.util.Random;

/**
 * Created by hxq on 2017/3/6.
 */
public class VerifyCodeUtil {

    public static Map<String, Object> checkPhoneNumber(String number) {
        Map<String, Object> result = Maps.newHashMap();
        result.put("flag", true);
        if (StringUtils.isEmpty(number)) {
            result.put("flag", false);
            result.put("msg", "手机号码不能为空!");
            return result;
        }
        if (!number.matches("^1[3|4|5|7|8][0-9]\\d{4,8}$")) {
            result.put("flag", false);
            result.put("msg", "手机号码输入不正确！");
            return result;
        }
        return result;
    }
    public static Map sendPhoneNumber(String number) {
        return null;
    }
    public static String createVerifyCode() {
        Random r = new Random();
        StringBuilder sb = new StringBuilder(6);
        for (int i = 0; i < 6; i++) {
            sb.append(r.nextInt(9));
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        for (int i = 0; i < 5; i++) {
            String aa = createVerifyCode();
            System.out.println(aa);
        }
    }

}
