package com.hiveview.util.SMS;

/**
 * Created by hxq on 2017/4/12.
 */
public class SmsUtil {

    public static final Integer TIME_OUT = 10;//超时分钟
    public static final String VERIFY_CODE_KEY = "verifyCode";//验证码
    public static final String VERIFY_TIME_KEY = "verifyTime";//验证时间
    public static final String VERIFY_PHONE_KEY = "verifyPhone";//验证电话

    public enum SendType{
        REGISTER_SMS("registerSms"),//注册
        RETRIEVE_PASSWORD_SMS("retrievePasswordSms");//找回密码

        private String val;

        SendType(String p) {
            this.val = p;
        }
        public String getVal() {
            return val;
        }
    }
    public enum Status{
        SUCCESS(0);//成功
        private int val;
        Status(int p) {
            this.val = p;
        }
        public int getVal() {
            return val;
        }
    }
}
