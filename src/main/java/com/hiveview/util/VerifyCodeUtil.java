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

    /**
     *生成指定位数的验证码
     * @param bix 位数
     * @return
     */
    public static String createVerifyCode(int bix) {
        String code = "";
        if (bix > 0 ) {
            StringBuilder sb = new StringBuilder(bix);
            Random r = new Random();
            for (int i = 0; i < bix; i++) {
                sb.append(r.nextInt(9));
            }
            code = sb.toString();
        }
        return code;
    }

    public static void main(String[] args) {
        for (int i = 0; i < 5; i++) {
            String aa = createVerifyCode(4);
            System.out.println(aa);
        }
    }

}
