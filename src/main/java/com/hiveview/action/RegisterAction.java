package com.hiveview.action;

import com.google.common.collect.Maps;
import com.hiveview.entity.Member;
import com.hiveview.service.IMemberService;
import com.hiveview.service.IRegisterService;
import com.hiveview.util.AuthCodeUtil;
import com.hiveview.util.log.LogMgr;
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
        Map<String, Object> msg = AuthCodeUtil.checkPhoneNumber(member.getMobile());
        if(!Boolean.parseBoolean(msg.get("flag").toString())){
            return msg;
        }
        Boolean flag = false;
        String message = "";
        HashMap<String, Object> result = Maps.newHashMap();
        if (registerService.checkPhoneRegister(mobile)) {
            try {
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
    @RequestMapping(value = "checkAuthCode")
    public Map checkVerificationCode(HttpServletRequest request){

        HashMap<String, Object> result = Maps.newHashMap();

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
//        String phoneNumber = request.getParameter("phoneNumber");

        Map<String, Object> msg = AuthCodeUtil.checkPhoneNumber(phoneNumber);
        if(!Boolean.parseBoolean(msg.get("flag").toString())){
            return msg;
        }
        HashMap<String, Object> result = Maps.newHashMap();
        if (!registerService.checkPhoneRegister(phoneNumber)) {
            result.put("flag", false);
            result.put("msg", "此手机号已经被注册！");
            return result;
        }
       String authCode= AuthCodeUtil.createAuthCode();
        System.out.println(authCode);
        request.getSession().setAttribute("",authCode);


        return result;
    }

    /**
     * 修改密码
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "updatePW")
    public Boolean updatePW(HttpServletRequest request){
        Boolean result;
        String oldPW =request.getParameter("oldPW");
        String newPW =request.getParameter("newPW");
        long memberId = super.getMemberId(request);
        boolean flag= registerService.verifyPW(super.getMemberId(request),oldPW);
        if (flag) {
            if (!(oldPW.equals(newPW))) {
                Member member = new Member();
                member.setId(memberId);
                member.setPassword(newPW);
                memberService.updateMember(member);
            }
            result = true;
        } else {
            result = false;
        }

        return result;
    }



}
