package com.hiveview.util.SMS;

import com.google.common.collect.Maps;
import com.hiveview.util.ProperManager;
import com.hiveview.util.VerifyCodeUtil;
import com.hiveview.util.validateCode.ValidateCode;
import com.hiveview.util.validateCode.ValidateCodeUtil;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by hxq on 2017/4/12.
 *
 *结果调用返回结果
 //    {
 //        "result": 0, //0表示成功(计费依据)，非0表示失败
 //            "errmsg": "OK", //result非0时的具体错误信息
 //            "ext": "", //用户的session内容，腾讯server回包中会原样返回
 //            "sid": "xxxxxxx", //标识本次发送id，标识一次短信下发记录
 //            "fee": 1 //短信计费的条数
 //    }
 */
public class SmsSendUtil {

    /**
     *单发注册短信
     * @param name
     * @return
     */
    public static boolean sendRegisterSms(String phone, HttpServletRequest request) {
        Integer tmplId = Integer.parseInt(ProperManager.getString(SmsConfigKey.SMS_REGISTER_TEMPLATE.toString()));
        return sendSms(phone, VerifyUtil.SmsVerifyType.REGISTER.getVal(),tmplId,request);
    }

    /**
     * 单发注册找回密码短信
     * @param name
     * @param request
     * @return
     */
    public static boolean sendRetrievePasswordSms(String phone, HttpServletRequest request) {
        Integer tmplId = Integer.parseInt(ProperManager.getString(SmsConfigKey.SMS_RETRIEVE_PASSWORD_TEMPLATE.toString()));
        return sendSms(phone, VerifyUtil.SmsVerifyType.RETRIEVE_PASSWORD.getVal(),tmplId,request);
    }

    /**
     * @param phone
     * @param type //存储的key，发送的类型
     * @param request
     * @return
     */
    private static boolean sendSms(String phone,String type,int tmplId, HttpServletRequest request) {
        boolean flag = false;
        try {
            SmsSingleSender singleSender = SmsSingleSender.getIstance();
            ArrayList<String> params = new ArrayList<>();
            String verifyCode = VerifyCodeUtil.createVerifyCode(6);
            params.add(verifyCode);//验证码
            params.add(VerifyUtil.TIME_OUT.toString());//超时时间
            SmsSingleSenderResult singleSenderResult = singleSender.sendWithParam("86", phone, tmplId, params, "", "", "");
            if (singleSenderResult != null && singleSenderResult.result == VerifyUtil.Status.SUCCESS.getVal()) {
                Map<String, Object> verifyMsg = Maps.newHashMap();
                verifyMsg.put(VerifyUtil.VERIFY_CODE_KEY, verifyCode);
                verifyMsg.put(VerifyUtil.VERIFY_TIME_KEY, new Date());
                verifyMsg.put(VerifyUtil.VERIFY_PHONE_KEY, phone);
                request.getSession().setAttribute(type,verifyMsg);
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 验证验证码是否正确
     * @param request
     * @param verifyCode
     * @param verifyPhone 验证电话
     * @param type 验证的类型
     * @return
     */
    public static HashMap<String, Object> verifyCode(HttpServletRequest request, String verifyPhone, String verifyCode,String type) {
        HashMap<String, Object> result = Maps.newHashMap();
        Boolean flag = false;
        String message = "";
        HttpSession session = request.getSession();
        Map<String,Object> smsVal = (Map<String, Object>) session.getAttribute(type);
        if (MapUtils.isNotEmpty(smsVal)) {
            String phone = (String) smsVal.get(VerifyUtil.VERIFY_PHONE_KEY);
            if (phone != null && phone.equals(verifyPhone)) {
                String code = (String) smsVal.get(VerifyUtil.VERIFY_CODE_KEY);
                if (code != null && verifyCode.equals(code)) {
                    Date time = (Date) smsVal.get(VerifyUtil.VERIFY_TIME_KEY);
                    if (time != null) {
                        Calendar currentTime = Calendar.getInstance();//当前时间
                        Calendar verifyTime = Calendar.getInstance();
                        verifyTime.setTime(time);
                        verifyTime.add(Calendar.MINUTE, VerifyUtil.TIME_OUT);//验证时间 加十分钟
                        if (currentTime.before(verifyTime)) {//当前在验证时间加十分钟之前说明没超时
                            session.setAttribute(type, null);//验证完后把验证码清空
                            flag = true;
                        }else {
                            message = "短信验证码已超时！";
                        }
                    }
                }else {
                    message = "短信验证码错误！";
                }
            } else {
                message = "验证电话错误！";
            }
        } else {
            message = "请发送短信验证码！";
        }
        result.put("flag", flag);
        result.put("msg", message);
        return result;
    }


    /**
     * 验证图片和短信验证码
     * @param request
     * @return
     */
    public static HashMap<String, Object> validateSmsAndImgCode(HttpServletRequest request) {
        HashMap<String, Object> result = Maps.newHashMap();
        result.put("flag", false);
        String type = request.getParameter("verifyType");
        String imgCode = request.getParameter("imgCode");
        //验证图片验证码
        ValidateCode imgVerify = ValidateCodeUtil.validateImgCode(request, imgCode, type);
        if (!imgVerify.isSuccess()) {
            result.put("msg", imgVerify.getMsg());
            return result;
        }
        String verifyCode = request.getParameter("msgCode");
        String verifyPhone = request.getParameter("mobile");
        //验证短信验证码
        if (StringUtils.isNotEmpty(verifyCode)) {
            if ("reg".equals(type)) {
                result = SmsSendUtil.verifyCode(request,verifyPhone,verifyCode , VerifyUtil.SmsVerifyType.REGISTER.getVal());
            } else {
                result = SmsSendUtil.verifyCode(request,verifyPhone,verifyCode , VerifyUtil.SmsVerifyType.RETRIEVE_PASSWORD.getVal());
                if ((boolean)result.get("flag") == true) {
                    //找回密码通过sessionkey
                    request.getSession().setAttribute("retrievePasswordThroughPhone",verifyPhone);
                }
            }
        } else {
            result.put("msg", "短信验证码错误！");
        }
        return result;
    }
}
