package com.hiveview.action;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hiveview.entity.Area;
import com.hiveview.entity.Company;
import com.hiveview.entity.Member;
import com.hiveview.entity.Paging;
import com.hiveview.service.IAreaService;
import com.hiveview.service.ICompanyService;
import com.hiveview.service.IMemberService;
import utils.StatusUtil;
import utils.log.LogMgr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/member/company")
public class CompanyAction extends BaseController{

	@Autowired
	private IMemberService memberService;
	@Autowired
	private ICompanyService companyService;
	@Autowired
	private IAreaService areaService;


	@RequestMapping(value="/list")
	public ModelAndView list(HttpServletRequest request,ModelAndView mav) {
		Long memberId = super.getMemberId(request);
		Member member =  memberService.getMemberDetail(memberId);
		mav.getModel().put("member", member);
		mav.setViewName("company/company_list");
		return mav;
	}

	/**
	 * 会员中心关联企业
	 * @return
	 */
	@RequestMapping(value="/page")
	public ModelAndView list(HttpServletRequest request, ModelAndView mav, Company company) {
		Paging paging = super.getPaging(request);
		Page<Object> page = PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize());
		List<Company> companys = companyService.getCompanyPage(company);
		paging.setTotalPages(page.getPages());
		mav.getModel().put("paging",paging);
		mav.getModel().put("companys",companys);
		mav.setViewName("company/paging");
		return mav;
	}

	/**
	 * 跳转添加企业
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd(HttpServletRequest request,ModelAndView mav) {
		List<Area> oneLevelAreas = areaService.getAllOneLevel();
		mav.getModel().put("oneLevelAreas", oneLevelAreas);
		mav.setViewName("company/company_add");
		return mav;
	}


	/**
	 * 查询会员是否已经有公司
	 * @return 0 没有公司，1审核中，2审核成功,3申请公司没有改变
	 */
	@ResponseBody
	@RequestMapping(value="/memberIsJoinCompany")
	public Integer memberIsJoinCompany(HttpServletRequest request) {
		String companyId = request.getParameter("id");
		Integer result = 0;
		Long memberId = super.getMemberId(request);
		Member member = memberService.getMemberDetail(memberId);
		Long mcId = member.getCompanyId();
		if (mcId != null) {
			if (companyId == null || !companyId.equals(mcId.toString())) {
				if (member.getCheckStatus() == StatusUtil.CHECKING.getVal()) {
					result = 1;
				}
				if (member.getCheckStatus() == StatusUtil.CHECK_SUCCESS.getVal()) {
					result = 2;
				}
			} else {
				result = 3;
			}
		}
		return result;
	}
	@ResponseBody
	@RequestMapping(value="/add")
	public Boolean addCompany(HttpServletRequest request,Company company) {
		Boolean flag = false;
		try {
			if (company != null && company.getId() == null) {
				companyService.saveCompany(company);
			}
			if (company.getId()!=null) {
				Member member = new Member();
				member.setId(super.getMemberId(request));
				member.setCompanyId(company.getId());
				member.setRelateCompanyDate(new Date());
                member.setCheckStatus(StatusUtil.CHECKING.getVal());
				memberService.updateMember(member);
				flag = true;
			}
		} catch (Exception e) {
			LogMgr.writeErrorLog("新建公司出错",e);
		}

		return flag;
	}



	@RequestMapping(value="/toSuccess")
	public String toSuccess(HttpServletRequest request) {
		return "company/success";
	}

}
