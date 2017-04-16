package com.hiveview.action;

import com.hiveview.entity.Member;
import com.hiveview.service.IMemberService;
import com.hiveview.service.IRegisterService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/member/account")
public class AccountAction extends BaseController{

    @Autowired
    private IRegisterService registerService;
    @Autowired
    private IMemberService memberService;

    @RequestMapping(value="/toUpdatePW")
    public String list() {
        return "account/update_pwd";
    }
    /**
     * 修改密码
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "updatePW")
    public Boolean updatePW(HttpServletRequest request){
        Boolean result = false;
        String oldPW =request.getParameter("oldPW");
        String newPW =request.getParameter("newPW");
        if (StringUtils.isNotEmpty(oldPW) && StringUtils.isNotEmpty(newPW)) {
            long memberId = super.getMemberId(request);
            oldPW = DigestUtils.md5DigestAsHex((oldPW+memberId).getBytes());
            newPW = DigestUtils.md5DigestAsHex((newPW+memberId).getBytes());
            boolean flag = registerService.verifyPW(memberId, oldPW);
            if (flag) {
                if (!(oldPW.equals(newPW))) {
                    Member member = new Member();
                    member.setId(memberId);
                    member.setPassword(newPW);
                    memberService.updateMember(member);
                }
                result = true;
            }
        }

        return result;
    }

}
