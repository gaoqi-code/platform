package com.hiveview.util.SMS;

/**
 * Created by hxq on 2017/4/12.
 */
public class VerifyUtil {

    public static final Integer TIME_OUT = 10;//超时分钟
    public static final String VERIFY_CODE_KEY = "verifyCode";//验证码
    public static final int VERIFY_MAX_TIMES = 5;//最大验证次数
    public static final String VERIFY_TIME_KEY = "verifyTime";//验证时间
    public static final String VERIFY_PHONE_KEY = "verifyPhone";//验证电话

    public enum SmsVerifyType {//短信验证码
        REGISTER("registerSmsCode"),//注册
        RETRIEVE_PASSWORD("retrievePasswordSmsCode");//找回密码

        private String val;

        SmsVerifyType(String p) {
            this.val = p;
        }
        public String getVal() {
            return val;
        }
    }
    public enum ImgVerifyType{//图片验证码
        REGISTER("registerVerifyCode"),//注册
        RETRIEVE_PASSWORD("retrievePasswordVerifyCode");//找回密码

        private String val;

        ImgVerifyType(String p) {
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
