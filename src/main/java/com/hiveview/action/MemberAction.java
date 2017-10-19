package com.hiveview.action;

import com.google.common.collect.Maps;
import com.hiveview.entity.Area;
import com.hiveview.entity.Category;
import com.hiveview.entity.Member;
import com.hiveview.service.IAreaService;
import com.hiveview.service.ICategoryService;
import com.hiveview.service.ICompanyService;
import com.hiveview.service.IMemberService;
import com.hiveview.util.LevelUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import utils.IssueType;
import utils.MemberType;
import utils.StatusUtil;

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
	@Autowired
	private ICategoryService categoryService;


	/**
	 * 会员中心首页
	 * @return
	 */
	@RequestMapping(value="/index")
	public ModelAndView memberIndex(HttpServletRequest request,ModelAndView mav) {
		request.setAttribute("index","hover");
//		List<Member> counselors = memberService.getRecommendCounselorList();
		Member member = new Member();
		member.setId(super.getMemberId(request));
		member =  memberService.getMemberInfo(member);
		if(member.getType()==0){
			String areaCode = member.getAreaCode();
			if (StringUtils.isNotEmpty(areaCode)) {
				Area area = areaService.getAreaByCode(areaCode);
				member.setAreaFullName(Optional.ofNullable(area).map(a -> a.getFullName()).orElse(null));
			}
			mav.getModel().put("member", member);
			mav.setViewName("member/person_index");
			return mav;
		}
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
		mav.setViewName("member/index1");
		return mav;
	}
	@RequestMapping(value="/userInfo")
	public ModelAndView userInfo(HttpServletRequest request,ModelAndView mav) {
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
		mav.setViewName("member/info/user_info");
		return mav;
	}


    @RequestMapping(value="/store")
    public ModelAndView memberStore(HttpServletRequest request,ModelAndView mav) {
        request.setAttribute("store","hover");
        mav.setViewName("member/store");
        return mav;
    }

	@RequestMapping(value="/toMember")
	public String selectMemberType(HttpServletRequest request) {
		Member member = new Member();
		member.setId(super.getMemberId(request));
		Object type = request.getParameter("type");
		if(null!=type&&type.equals("adviser")){
			member.setType(MemberType.ADVISER.getVal());
			member.setStatus(StatusUtil.VALID.getVal());
		}else{
			member.setType(MemberType.GENERAL.getVal());
			member.setStatus(StatusUtil.CHECK_SUCCESS.getVal());
		}
		memberService.updateMember(member);
		//更新session里面的值
		HttpSession session = request.getSession();
		Member memberSession = (Member) session.getAttribute("currentUser");
		memberSession.setType(member.getType());
		session.setAttribute("currentUser", memberSession);
		return "redirect:/member/info.html";
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

    @RequestMapping(value="/toCooperation")
    public String toCooperation(HttpServletRequest request) {
        request.setAttribute("cooperation","hover");
        return "company/cooperation";
    }

    @RequestMapping(value="/toManagement")
    public ModelAndView toManagement(HttpServletRequest request,ModelAndView mav) {
		Member member = new Member();
		member.setId(super.getMemberId(request));
		member =  memberService.getMemberInfo(member);
        request.setAttribute("management","hover");
		mav.getModel().put("member",member);
		mav.setViewName("company/management");
        return mav;
    }

    @RequestMapping(value="/toPersonalData")
    public ModelAndView toPersonalData(HttpServletRequest request,ModelAndView mav) {
        request.setAttribute("personaldata","hover");
		Member member = new Member();
		member.setId(super.getMemberId(request));
		member =  memberService.getMemberInfo(member);
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
		List<Category> oneLevelCategories = getCategories();
		mav.getModel().put("oneLevelCategories", oneLevelCategories);
		mav.getModel().put("oneLevelAreas", oneLevelAreas);
		mav.getModel().put("member", member);
		mav.setViewName("member/personal_data");
        return mav;
    }

	private List<Category> getCategories() {
		//获得所有一级类目
		Category category = new Category();
		category.setLevel(LevelUtil.ONE_LEVEL.getVal());
		category.setType(IssueType.ADVISER.getVal());
		return categoryService.getCategory(category);
	}

}
