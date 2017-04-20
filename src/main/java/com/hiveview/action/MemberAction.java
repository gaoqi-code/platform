package com.hiveview.action;

import com.google.common.collect.Maps;
import com.hiveview.entity.Area;
import com.hiveview.entity.Member;
import com.hiveview.service.IAreaService;
import com.hiveview.service.ICompanyService;
import com.hiveview.service.IMemberService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
	@Autowired
	private IAreaService areaService;

	/**
	 * 会员中心首页
	 * @return
	 */
	@RequestMapping(value="/index")
	public ModelAndView memberIndex(HttpServletRequest request,ModelAndView mav) {
		request.setAttribute("nav","center");
//		List<Member> counselors = memberService.getRecommendCounselorList();
		Member member = new Member();
		member.setId(super.getMemberId(request));
		member =  memberService.getMemberInfo(member);
		if (member != null) {
			Long companyId = member.getCompanyId();
			if (Optional.ofNullable(companyId).isPresent()) {
				member.setCompanyName(companyService.getCompanyNameById(companyId));
			}
			if(null!=member.getDescription()&&member.getDescription().length()>200){
				member.setDescription(member.getDescription().substring(0,200)+"...");
			}
		}

		mav.getModel().put("member", member);
//		mav.getModel().put("counselors", counselors);
		mav.setViewName("member/index");
		return mav;
	}

	@RequestMapping(value="/toMember")
	public String selectMemberType(HttpServletRequest request) {
		Member member = new Member();
		member.setId(super.getMemberId(request));
		Object type = request.getParameter("type");
		if(null!=type&&type.equals("adviser")){
			member.setType(1);
			member.setStatus(1);
		}else{
			member.setType(0);
			member.setStatus(4);
		}
		memberService.updateMember(member);
		//更新session里面的值
		HttpSession session = request.getSession();
		Member memberSession = (Member) request.getSession().getAttribute("currentUser");
		memberSession.setType(member.getType());
		session.setAttribute("currentUser", memberSession);
		return "member/member_info";
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
		List<Area> oneLevelAreas = areaService.getAllOneLevel();
		String areaCode = member.getAreaCode();
		if (StringUtils.isNotEmpty(areaCode)) {
			Area selectArea = new Area();
			List<Area> twoLevelAreas;
			List<Area> threeLevelAreas;
			String[] areas = areaCode.split("-");
			for (int i = 0; i < areas.length; i++) {
				Long areaId = Long.parseLong(areas[i]);
				if (i == 0) {
					twoLevelAreas = areaService.getSonAreas(areaId);
					mav.getModel().put("twoLevelAreas", twoLevelAreas);
					selectArea.setOneLevel(areaId);
				}
				if (i == 1) {
					threeLevelAreas = areaService.getSonAreas(areaId);
					mav.getModel().put("threeLevelAreas", threeLevelAreas);
					selectArea.setTwoLevel(areaId);
				}
				if (i == 2) {
					selectArea.setThreeLevel(areaId);
				}
			}
			mav.getModel().put("selectArea", selectArea);
		}
		mav.getModel().put("oneLevelAreas", oneLevelAreas);
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
		int num =  memberService.updateMember(member);
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

	/**
	 * 获得邀请注册邀请码
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getInviteCode")
	public String getInviteCode(HttpServletRequest request) {
		long memberId = super.getMemberId(request);
		return memberService.getInviteCodeById(memberId);
	}

}
