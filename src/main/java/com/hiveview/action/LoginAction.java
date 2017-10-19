package com.hiveview.action;

import com.google.common.collect.Maps;
import com.hiveview.entity.Member;
import com.hiveview.entity.Msg;
import com.hiveview.service.IMemberService;
import com.hiveview.util.Data;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;


@Controller
@RequestMapping("")
public class LoginAction {

	@Autowired
    IMemberService memberService;

	@RequestMapping(value="/tologin")
	public ModelAndView login(HttpServletRequest request, ModelAndView mav) {
		String fromUrl = request.getParameter("fromUrl");
		if (StringUtils.isNotEmpty(fromUrl)) {
			mav.getModel().put("fromUrl", fromUrl);
		}
		mav.setViewName("login");
		return mav;
	}


	@RequestMapping(value = "/loginChecksession", method = RequestMethod.POST)
	public Data loginChecksession(HttpServletRequest req) {
		if(req.getSession().getAttribute("currentUser") != null)
			return new Data(1,"");
		else
			return new Data(0,"会话没有信息，已经退出登录！");
	}
	@ResponseBody
	@RequestMapping(value = "/login")
	public Map<String ,Object> login(HttpServletRequest req, Member member) {
		Map<String, Object> result = Maps.newHashMap();
		Boolean flag = false;
		String message = "用户名或密码错误！";
		try {
			String mobile = member.getMobile();
			if (mobile != null) {
				Member tempMember= memberService.getMemberByMobile(mobile);
				if (tempMember != null) {
					String pass = member.getPassword()+ tempMember.getId();//密码加会员id加密
					member.setPassword(DigestUtils.md5DigestAsHex(pass.getBytes()));
					Member currentUser = memberService.getMemberInfo(member);
					if( currentUser != null){
						HttpSession session = req.getSession();
						session.setAttribute("currentUser", currentUser);
						String sessionId = session.getId();
						//登录用户的信息放到application
						ServletContext application = session.getServletContext();
						Msg.getInstance().put(currentUser.getId().toString(),sessionId);
						application.setAttribute("sessionIdMap",Msg.sessionIdMap);
						flag = true;
						message = "登录成功！";
						String fromUrl = req.getParameter("fromUrl");
						if (StringUtils.isNotEmpty(fromUrl)) {
							result.put("fromUrl", fromUrl);
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
			message = "登录异常";
		}
		result.put("flag", flag);
		result.put("msg", message);
		return result;
	}

	@RequestMapping(value = "/logout")
	public String exit(HttpServletRequest request) {
		request.setAttribute("loginInfo","");
		request.getSession().invalidate();
		return "login";
	}

}
