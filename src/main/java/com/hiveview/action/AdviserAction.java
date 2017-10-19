package com.hiveview.action;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.StringUtil;
import com.hiveview.entity.*;
import com.hiveview.service.ICategoryService;
import com.hiveview.service.IMemberService;
import com.hiveview.service.IProductService;
import com.hiveview.util.MemberType;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import utils.IssueType;
import utils.StatusUtil;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

/**
 * Created by huxunqiang on 17/3/19.
 */
@Controller
@RequestMapping("/adviser")
public class AdviserAction extends BaseController{

	@Autowired
	private IMemberService memberService;
	@Autowired
	private IProductService productService;
	@Autowired
	private ICategoryService categoryService;
	@RequestMapping(value="/toSearch")
	public ModelAndView toSearch(HttpServletRequest request, ModelAndView mav) {
		String keyword = request.getParameter("keyword");
		if (StringUtil.isNotEmpty(keyword)) {
			try {
				keyword = URLDecoder.decode(keyword,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			mav.getModel().put("keyword", keyword);
		}
		//得到所需要的类目
		String categoryCode = request.getParameter("code");
		if (StringUtils.isNotEmpty(categoryCode)) {
			mav.getModel().put("categoryCode", categoryCode);
		}
		LevelCategoriesDto levelCategories = categoryService.getLevelCategory(categoryCode, IssueType.ADVISER.getVal());
		List<Category> oneLevelCategories = levelCategories.getOneLevelCategories();
		if (CollectionUtils.isNotEmpty(oneLevelCategories)) {
			mav.getModel().put("oneLevelCategories", oneLevelCategories);
			List<Category> twoLevelCategories = levelCategories.getTwoLevelCategories();
			if (CollectionUtils.isNotEmpty(twoLevelCategories)) {
				mav.getModel().put("twoLevelCategories", twoLevelCategories);
				List<Category> threeLevelCategories = levelCategories.getThreeLevelCategories();
				if (CollectionUtils.isNotEmpty(threeLevelCategories)) {
					mav.getModel().put("threeLevelCategories", threeLevelCategories);
				}
			}
		}
		mav.getModel().put("cAdviserNav","navCurrent");
		mav.setViewName("adviser/adviser_list");
		return mav;
	}
	@RequestMapping(value="/page")
	public ModelAndView page(HttpServletRequest request, ModelAndView mav) {
		Paging paging = super.getPaging(request);
		Member member = new Member();
		String keyword = request.getParameter("keyword");
		if (StringUtil.isNotEmpty(keyword)) {
			member.setName(keyword);
		}
		String areaCode = request.getParameter("areaCode");
		if (StringUtil.isNotEmpty(areaCode)) {
			member.setAreaCode(areaCode);
		}
		String classCode = request.getParameter("classCode");
		if (StringUtil.isNotEmpty(classCode)) {
			member.setAdviserType(classCode);
		}

		String productId = request.getParameter("productId");
		if (StringUtil.isNotEmpty(productId)) {
			member.setProductId(Integer.valueOf(productId));
		}

		member.setCheckStatus(StatusUtil.CHECK_SUCCESS.getVal());
		member.setType(MemberType.ADVISER.getVal());
		member.setStatus(StatusUtil.VALID.getVal());
		Page<Object> page = PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize());
		List<Member> members =  memberService.getOpendMemberPage(member);
		paging.setTotalPages(page.getPages());
		paging.setTotalCount(page.getTotal());
		mav.getModel().put("paging",paging);
		mav.getModel().put("members",members);

		mav.setViewName("adviser/paging");
		return mav;
	}


	@RequestMapping(value="/detail/{memberId}")
	public ModelAndView detail(ModelAndView mav,@PathVariable("memberId") long memberId,HttpServletRequest request) {

		Member member = memberService.getMemberDetail(memberId);
		mav.getModel().put("member", member);

		Paging paging = super.getPaging(request);
		Product product = new Product();
		product.setMemberId(memberId);
//        need.setStatus(StatusUtil.VALID.getVal());
		Page<Object> page = PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize());
		List<Product> products =  productService.getProductPage(product);
		paging.setTotalPages(page.getPages());
		mav.getModel().put("paging",paging);
		mav.getModel().put("products",products);
//		mav.setViewName("need/paging");
		mav.setViewName("adviser/detail");
		return mav;
	}

}
