package com.hiveview.action;

import com.google.common.collect.Maps;
import com.hiveview.service.IRegisterService;
import com.hiveview.util.SMS.SmsSendUtil;
import com.hiveview.util.SMS.SmsUtil;
import com.hiveview.util.VerifyCodeUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hxq on 2017/4/12.
 */
@Controller
@RequestMapping("/retrieveAccount")
public class RetrieveAccountAction {

    @Autowired
    private IRegisterService registerService;
    /**
     * 发送手机验证码
     * @param request
     * @param phoneNumber
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "sendVerificationCode")
    public Map sendVerificationCode(HttpServletRequest request, String phoneNumber){

        Map<String, Object> msg = VerifyCodeUtil.checkPhoneNumber(phoneNumber);
        if(!Boolean.parseBoolean(msg.get("flag").toString())){
            return msg;
        }
        HashMap<String, Object> result = Maps.newHashMap();
        if (registerService.checkPhoneRegister(phoneNumber)) {
            result.put("flag", false);
            result.put("msg", "此手机号未被注册！");
            return result;
        }
        boolean isSuccess = SmsSendUtil.sendRetrievePasswordSms(phoneNumber, request);
        String sendMsg;
        if (isSuccess) {
            sendMsg = "发送成功！";
        } else {
            sendMsg = "发送失败！";
        }
        result.put("flag", isSuccess);
        result.put("msg", sendMsg);
        return result;
    }


    /**
     * 验证手机验证码
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "checkVerifyCode")
    public Map checkVerificationCode(HttpServletRequest request){
        HashMap<String, Object> result;
        String verifyCode = request.getParameter("verifyCode");
        String verifyPhone = request.getParameter("verifyPhone");
        if (StringUtils.isNotEmpty(verifyCode)) {
            result = SmsSendUtil.verifyCode(request,verifyPhone,verifyCode , SmsUtil.SendType.RETRIEVE_PASSWORD_SMS.getVal());
        } else {
            result = Maps.newHashMap();
            result.put("flag", false);
            result.put("msg", "验证码错误！");
        }
        return result;
    }
}
