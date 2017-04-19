package com.hiveview.action;

import com.google.common.collect.Maps;
import com.hiveview.service.IRegisterService;
import com.hiveview.util.SMS.SmsSendUtil;
import com.hiveview.util.SMS.VerifyUtil;
import com.hiveview.util.VerifyCodeUtil;
import com.hiveview.util.validateCode.ValidateCode;
import com.hiveview.util.validateCode.ValidateCodeUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hxq on 2017/3/6.
 */
@Controller
@RequestMapping("/validate")
public class ValidateAction extends BaseController{

    @Autowired
    private IRegisterService registerService;

    /**
     * 发送图片验证码
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "sendImgCode")
    public ValidateCode sendVerificationCode(HttpServletRequest request){
        ValidateCode validateCode;
        String type = request.getParameter("verifyType");
        if (StringUtils.isNotEmpty(type)) {
            if ("reg".equals(type)) {
                type = VerifyUtil.ImgVerifyType.REGISTER.getVal();
            } else {
                type = VerifyUtil.ImgVerifyType.RETRIEVE_PASSWORD.getVal();
            }
            validateCode = ValidateCodeUtil.createVerifyCode(type, request);
        } else {
            validateCode = new ValidateCode();
            validateCode.setSuccess(false);
        }
        return validateCode;
    }

    /**
     * 验证图片验证码
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "checkImgCode")
    public ValidateCode checkImgCode(HttpServletRequest request){
        ValidateCode validateCode;
        String verifyCode = request.getParameter("imgCode");
        String type = request.getParameter("verifyType");
        validateCode = ValidateCodeUtil.validateImgCode(request, verifyCode, type);
        return validateCode;
    }


    /**
     * 发送手机验证码
     * @param request
     * @param phoneNumber
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "sendSmsCode")
    public Map sendSmsCode(HttpServletRequest request){
        String phoneNumber = request.getParameter("mobile");
        Map<String, Object> msg = VerifyCodeUtil.checkPhoneNumber(phoneNumber);
        if(!Boolean.parseBoolean(msg.get("flag").toString())){
            return msg;
        }
        HashMap<String, Object> result = Maps.newHashMap();
        result.put("flag", false);
        String type = request.getParameter("verifyType");
        String imgCode = request.getParameter("imgCode");
        ValidateCode imgVerify = ValidateCodeUtil.validateImgCode(request, imgCode, type);
        if (!imgVerify.isSuccess()) {
            result.put("msg", imgVerify.getMsg());
            return result;
        }
        boolean isSuccess;
        boolean isReg = registerService.checkPhoneRegister(phoneNumber);//是否可以注册
        if ("reg".equals(type)) {
            if (!isReg) {
                result.put("msg", "此手机号已经被注册！");
                return result;
            }
            isSuccess = SmsSendUtil.sendRegisterSms(phoneNumber, request);
        } else {
            if (isReg) {
                result.put("msg", "此手机号未被注册！");
                return result;
            }
            isSuccess = SmsSendUtil.sendRetrievePasswordSms(phoneNumber, request);
        }
        result.put("flag", isSuccess);
        result.put("msg", isSuccess ? "发送成功！":"发送失败！");
        return result;
    }

    /**
     * 验证手机验证码
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "checkSmsCode")
    public Map checkSmsCode(HttpServletRequest request){
        HashMap<String, Object> result = SmsSendUtil.validateSmsAndImgCode(request);
        return result;
    }


}
