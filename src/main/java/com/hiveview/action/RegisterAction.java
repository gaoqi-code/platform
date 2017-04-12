package com.hiveview.action;

import com.google.common.collect.Maps;
import com.hiveview.entity.Member;
import com.hiveview.service.IMemberService;
import com.hiveview.service.IRegisterService;
import com.hiveview.util.SMS.SmsSendUtil;
import com.hiveview.util.SMS.SmsUtil;
import com.hiveview.util.VerifyCodeUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.MemberUtil;
import utils.log.LogMgr;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hxq on 2017/3/6.
 */
@Controller
@RequestMapping("/register")
public class RegisterAction extends BaseController{

    @Autowired
    private IRegisterService registerService;
    @Autowired
    private IMemberService memberService;

    @ResponseBody
    @RequestMapping(value = "uploadPic")
    public Boolean uploadPic(HttpServletRequest request){

        return true;
    }


    /**
     * 注册会员
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "registerMember")
    public Map registerMember(HttpServletRequest request,Member member){
        String mobile = member.getMobile();
        Map<String, Object> msg = VerifyCodeUtil.checkPhoneNumber(member.getMobile());
        if(!Boolean.parseBoolean(msg.get("flag").toString())){
            return msg;
        }
        Boolean flag = false;
        String message = "";
        HashMap<String, Object> result = Maps.newHashMap();
        if (registerService.checkPhoneRegister(mobile)) {
            try {
                member.setPassword(DigestUtils.md5DigestAsHex(member.getPassword().getBytes()));
                member.setStatus(MemberUtil.STATUS.getNormal());
                member.setAddTime(new Date());
                if (memberService.saveMember(member) > 0) {
                    flag = true;
                    message ="注册成功！";
                }
            } catch (Exception e) {
                LogMgr.writeErrorLog("保存会员信息出错",e);
                flag = false;
                message ="保存会员信息出错！";
            }
        } else {
            flag = false;
            message ="此手机号已经被注册！";
        }
        result.put("flag", flag);
        result.put("msg", message);

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
            result = SmsSendUtil.verifyCode(request,verifyPhone,verifyCode ,SmsUtil.SendType.REGISTER_SMS.getVal());
        } else {
            result = Maps.newHashMap();
            result.put("flag", false);
            result.put("msg", "验证码错误！");
        }
        return result;
    }



    /**
     * 发送手机验证码
     * @param request
     * @param phoneNumber
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "sendAuthCode")
    public Map sendVerificationCode(HttpServletRequest request,String phoneNumber){

        Map<String, Object> msg = VerifyCodeUtil.checkPhoneNumber(phoneNumber);
        if(!Boolean.parseBoolean(msg.get("flag").toString())){
            return msg;
        }
        HashMap<String, Object> result = Maps.newHashMap();
        if (!registerService.checkPhoneRegister(phoneNumber)) {
            result.put("flag", false);
            result.put("msg", "此手机号已经被注册！");
            return result;
        }
        boolean isSuccess = SmsSendUtil.sendRegisterSms(phoneNumber, request);
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





}
