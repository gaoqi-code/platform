package com.hiveview.action;

import com.google.common.collect.Maps;
import com.hiveview.util.Data;
import com.hiveview.entity.Msg;
import com.hiveview.entity.Member;
import com.hiveview.service.IMemberService;
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
		Boolean flag;
		String message;
		try {
			member.setPassword(DigestUtils.md5DigestAsHex(member.getPassword().getBytes()));
			Member currentUser = memberService.getMemberInfo(member);
			if(null==currentUser){
				flag = false;
				message = "用户名或密码错误！";
			}else{
				HttpSession session = req.getSession();
				session.setAttribute("currentUser", currentUser);
				String sessionId = session.getId();
				//登录用户的信息放到application
				ServletContext application = session.getServletContext();
				Msg.getInstance().put(currentUser.getId().toString(),sessionId);
				application.setAttribute("sessionIdMap",Msg.sessionIdMap);
				flag = true;
				message = "登录成功！";
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
