package com.hiveview.action;

import com.hiveview.entity.Company;
import com.hiveview.entity.Member;
import com.hiveview.entity.Paging;
import com.hiveview.service.ICompanyService;
import com.hiveview.service.IMemberService;
import com.hiveview.util.log.LogMgr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/member/company")
public class CompanyAction extends BaseController{

	@Autowired
	private IMemberService memberService;
	@Autowired
	private ICompanyService companyService;


	@RequestMapping(value="/list")
	public String list() {
		return "company/company_list";
	}

	/**
	 * 会员中心关联企业
	 * @return
	 */
	@RequestMapping(value="/page")
	public ModelAndView list(HttpServletRequest request, ModelAndView mav, Company company) {
		Paging paging = super.getPaging(request, "j_company");
		List<Company> companys = companyService.getCompanyPage(company,paging.getSkipNo(),paging.getPageSize());
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
	public String toAdd(HttpServletRequest request) {
		return "company/company_add";
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
				memberService.updateInfo(member);
				flag = true;
			}
		} catch (Exception e) {
			LogMgr.writeErrorLog("新建公司出错",e);
		}

		return flag;
	}



}
