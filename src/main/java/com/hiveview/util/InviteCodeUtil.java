package com.hiveview.util;

/**
 * Created by hxq on 2017/4/20.
 */
public class InviteCodeUtil {

    /**
     * 获得一个随机邀请码
     * @param memberId
     * @return
     */
    public static String getInviteCode() {
        String code = System.currentTimeMillis() + VerifyCodeUtil.createVerifyCode(1);
        return code;
    }

    public static void main(String[] args) {
        System.out.println(System.currentTimeMillis());
    }

}
