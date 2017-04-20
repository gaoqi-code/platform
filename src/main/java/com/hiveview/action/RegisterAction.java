package com.hiveview.action;

import com.hiveview.entity.Member;
import com.hiveview.service.IMemberService;
import com.hiveview.service.IRegisterService;
import com.hiveview.util.InviteCodeUtil;
import com.hiveview.util.SMS.SmsSendUtil;
import com.hiveview.util.VerifyCodeUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import utils.MemberUtil;
import utils.log.LogMgr;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
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

    @RequestMapping(value="/reg/{inviteCode}")
    public ModelAndView reg(@PathVariable("inviteCode")String inviteCode, ModelAndView mav) {
        mav.getModel().put("inviteCode", inviteCode);
        mav.setViewName("reg");
        return mav;
    }
    /**
     * 注册会员
     * @param request
     * @param member
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "registerMember")
    public Map registerMember(HttpServletRequest request,Member member){
        String mobile = member.getMobile();
        Map<String, Object> result = VerifyCodeUtil.checkPhoneNumber(member.getMobile());
        if(!Boolean.parseBoolean(result.get("flag").toString())){
            return result;
        }
        result = SmsSendUtil.validateSmsAndImgCode(request);
        if (!(boolean)result.get("flag")) {
            return result;
        }
        Boolean flag = false;
        String message = "";

        if (registerService.checkPhoneRegister(mobile)) {
            try {
                member.setStatus(MemberUtil.STATUS.getDisable());
                member.setAddTime(new Date());
                member.setInviteCode(InviteCodeUtil.getInviteCode());
                if (memberService.saveMember(member) > 0) {
                    String pass = member.getPassword()+ member.getId();//密码加会员id加密
                    member.setPassword(DigestUtils.md5DigestAsHex(pass.getBytes()));
                    member.setStatus(MemberUtil.STATUS.getNormal());
                    memberService.updateMember(member);
                    String otherInviteCode = request.getParameter("otherInviteCode");
                    if (StringUtils.isNotEmpty(otherInviteCode) && !"0".equals(otherInviteCode)) {
                        //邀请码增填邀请方查看需求次数
                        memberService.addNeedViewCountByInviteCode(otherInviteCode,10);
                    }
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



}
