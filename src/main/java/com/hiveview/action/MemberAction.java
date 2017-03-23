package com.hiveview.action;

import com.google.common.collect.Maps;
import com.hiveview.entity.Member;
import com.hiveview.service.ICompanyService;
import com.hiveview.service.IMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/member")
public class MemberAction extends BaseController{

	@Autowired
	private IMemberService memberService;
	@Autowired
	private ICompanyService companyService;

	/**
	 * 会员中心首页
	 * @return
	 */
	@RequestMapping(value="/index")
	public ModelAndView memberIndex(HttpServletRequest request,ModelAndView mav) {
		request.setAttribute("nav","center");
		List<Member> counselors = memberService.getRecommendCounselorList();
		mav.getModel().put("counselors", counselors);
		mav.setViewName("member/index");
		return mav;
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
	public ModelAndView memberInfo(HttpServletRequest request,ModelAndView mav) {
		Member member = new Member();
		member.setId(super.getMemberId(request));
		member =  memberService.getMemberInfo(member);
		if (member != null) {
			Long companyId = member.getCompanyId();
			if (Optional.ofNullable(companyId).isPresent()) {
				member.setCompanyName(companyService.getCompanyNameById(companyId));
			}
		}
		mav.getModel().put("member", member);
		mav.setViewName("member/member_info");
		return mav;
	}
	/**
	 * 会员中心完善资料
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateInfo")
	public Map<String,Object> updateInfo(HttpServletRequest request, Member member) {
		member.setId(super.getMemberId(request));
		int num =  memberService.updateInfo(member);
		Map<String, Object> result = Maps.newHashMap();
		result.put("flag", num>0?true:false);
		return result;
	}

	/**
	 * 会员中心关联企业
	 * @return
	 */
	@RequestMapping(value="/companyList")
	public String list(HttpServletRequest request) {
		request.setAttribute("nav","myshop");
		return "company/associate_member_list";
	}

}
