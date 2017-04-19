package com.hiveview.action;

import com.hiveview.entity.Member;
import com.hiveview.service.IMemberService;
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

/**
 * Created by hxq on 2017/4/12.
 */
@Controller
@RequestMapping("/retrieveAccount")
public class RetrieveAccountAction {

    private static final  String PASS_FIND_KEY = "retrievePasswordThroughPhone";//找回密码通过sessionkey

    @Autowired
    private IMemberService memberService;


    @RequestMapping(value="/passFind")
    public ModelAndView passFind(HttpServletRequest request, ModelAndView mav) {
        mav.setViewName("account/password_find");
        return mav;
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
                    Member member = memberService.getMemberByMobile(passFindPhone);
                    if (member != null) {
                        password += member.getId();
                        member.setMobile(phone);
                        member.setPassword(DigestUtils.md5DigestAsHex(password.getBytes()));
                        memberService.updateMemberByMobile(member);
                        session.setAttribute(PASS_FIND_KEY,null);//清空session
                        flag = true;
                    }
                }
            }
          return flag;
        }

}
