package com.hiveview.action;

import com.hiveview.entity.AppDeveloper;
import com.hiveview.service.IDeveloperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberAction {

	@Autowired
	private IDeveloperService developerService;

	/**
	 * 会员中心首页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/index")
	public String memberIndex(HttpServletRequest request) {
		request.setAttribute("nav","center");
		return "member/index";
	}

	/**
	 * 会员中心我的店铺
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/myshop")
	public String myshop(HttpServletRequest request) {
		request.setAttribute("nav","myshop");
		return "member/my_shop";
	}

	/**
	 * 会员中心完善资料
	 * @return
	 */
	@RequestMapping(value="/info")
	public String memberInfo(HttpServletRequest request) {
		request.setAttribute("nav","center");
		return "member/member_info";
	}

	/**
	 * 会员中心关联企业
	 * @return
	 */
	@RequestMapping(value="/list")
	public String list(HttpServletRequest request) {
		request.setAttribute("nav","myshop");
		return "member/associate_member_list";
	}

	/**
	 * 添加企业
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/company_add")
	public String addCompany(HttpServletRequest request) {
		request.setAttribute("nav","myshop");
		return "member/company_add";
	}
}
