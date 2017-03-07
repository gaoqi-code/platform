package com.hiveview.action;

import com.google.common.collect.Maps;
import com.hiveview.service.IRegisterService;
import com.hiveview.util.AuthCodeUtil;
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
    @RequestMapping(value = "checkAuthCode")
    public Map updatePW(HttpServletRequest request){
        String oldPW =request.getParameter("oldPW");
        String newPW =request.getParameter("newPW");
        boolean flag= registerService.verifyPW(super.getMemberId(request),oldPW);


        return null;
    }



}
