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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hxq on 2017/4/12.
 */
@Controller
@RequestMapping("/retrieveAccount")
public class RetrieveAccountAction {

    private static final  String PASS_FIND_KEY = "retrievePasswordThroughPhone";//找回密码通过sessionkey

    @Autowired
    private IRegisterService registerService;
    @Autowired
    private IMemberService memberService;


    @RequestMapping(value="/passFind")
    public ModelAndView passFind(HttpServletRequest request, ModelAndView mav) {
        mav.setViewName("account/password_find");
        return mav;
    }

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
     * 找回密码验证手机验证码
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
            if ((boolean)result.get("flag") == true) {
                request.getSession().setAttribute(PASS_FIND_KEY,verifyPhone);
            }
        } else {
            result = Maps.newHashMap();
            result.put("flag", false);
            result.put("msg", "验证码错误！");
        }
        return result;
    }

    /**
     * 去修改密码页面
     * @param request
     * @param mav
     * @return
     */
    @RequestMapping(value="/toPassFindUpdate/{phone}")
    public ModelAndView toPassFindUpdate(@PathVariable("phone")String phone, ModelAndView mav) {
        mav.getModel().put("phone", phone);
        mav.setViewName("account/password_find_update");
        return mav;
    }

    /**
     * 找回密码验证手机验证码
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "passFindUpdate")
    public boolean passFindUpdate(HttpServletRequest request){
        boolean flag = false;
        String password =request.getParameter("password");
        String phone =request.getParameter("phone");
            if (StringUtils.isNotEmpty(password) && StringUtils.isNotEmpty(phone)) {
                HttpSession session = request.getSession();
                String passFindPhone = (String)session.getAttribute(PASS_FIND_KEY);
                //验证修改密码的电话是否是通过的找回密码的手机号
                if (StringUtils.isNotEmpty(passFindPhone) && phone.equals(passFindPhone)) {
                        Member member = new Member();
                        member.setMobile(phone);
                        member.setPassword(DigestUtils.md5DigestAsHex(password.getBytes()));
                        memberService.updateMemberByMobile(member);
                        session.setAttribute(PASS_FIND_KEY,null);//清空session
                        flag = true;
                }
            }
          return flag;
        }

}
