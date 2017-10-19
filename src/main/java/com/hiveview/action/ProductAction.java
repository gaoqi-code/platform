package com.hiveview.action;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hiveview.entity.Category;
import com.hiveview.entity.Member;
import com.hiveview.entity.Paging;
import com.hiveview.entity.Product;
import com.hiveview.service.ICategoryService;
import com.hiveview.service.IMemberService;
import com.hiveview.service.IProductService;
import com.hiveview.util.LevelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import utils.IssueType;
import utils.StatusUtil;
import utils.log.LogMgr;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/member/product")
public class ProductAction extends BaseController{
	@Autowired
	private IMemberService memberService;
	@Autowired
	private ICategoryService categoryService;

	@Autowired
	private IProductService productService;



	@RequestMapping(value="/list")
	public String list() {
		return "product/product_list";
	}
	@RequestMapping(value="/page")
	public ModelAndView page(HttpServletRequest request, ModelAndView mav) {
		Member member = new Member();
        long memberId = super.getMemberId(request);
        member.setId(memberId);
		member =  memberService.getMemberInfo(member);
		Paging paging = super.getPaging(request);
		Product product = new Product();
		product.setMemberId(memberId);
		Page<Object> page = PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize());
		List<Product> products =  productService.getProductPage(product);
		paging.setTotalPages(page.getPages());
		mav.getModel().put("member", member);
		mav.getModel().put("paging",paging);
		mav.getModel().put("products",products);
		mav.setViewName("product/paging");

		return mav;
	}

	@ResponseBody
	@RequestMapping(value="/operation")
	public Boolean operation(HttpServletRequest request,Product product) {
		Boolean flag = false;
		long memberId = super.getMemberId(request);
		if (memberId > 0  && product.getStatus() != null) {
			try {
				product.setUpdateTime(new Date());
				product.setMemberId(memberId);
				productService.updateProduct(product);
				flag = true;
			} catch (Exception e) {
				LogMgr.writeErrorLog(e);
			}
		}
		return flag;
	}


	@RequestMapping(value="/toAdd/{productId}")
	public ModelAndView add(HttpServletRequest request,ModelAndView mav, @PathVariable("productId") Long productId) {
		Category category = new Category();
		category.setLevel(LevelUtil.ONE_LEVEL.getVal());
		int type = IssueType.PRODUCT.getVal();
		category.setType(type);
		List<Category> oneLevelCategories = categoryService.getCategory(category);
		if (productId > 0 ) {
			Product product= productService.getProductById(productId);
			List<Category> twoLevelCategories = null;//二级类目
			List<Category> threeLevelCategories = null;//三级类目
			Category selectClass = categoryService.getCategoryByIdAndType(product.getClassId(),type);
			if (selectClass != null && selectClass.getCode() != null) {
				String code = selectClass.getCode();
				String[] ids = code.split("-");
				for (int i = 0; i < ids.length; i++) {
					Long id = Long.parseLong(ids[i]);
					if (i == 0 ) {
						twoLevelCategories = categoryService.getSonCategory(id);
						selectClass.setOneLevel(id);
					}
					if (i == 1) {
						threeLevelCategories = categoryService.getSonCategory(id);
						selectClass.setTwoLevel(id);
					}
					if (i == 2) {
						selectClass.setThreeLevel(id);
					}
				}
			}
			mav.getModel().put("selectClass", selectClass);
			mav.getModel().put("product", product);
			mav.getModel().put("twoLevelCategories", twoLevelCategories);
			mav.getModel().put("threeLevelCategories", threeLevelCategories);
		}
		Integer memberType = super.getMemberType(request);
		String page;
		if (memberType == 1) {
			page = "product/b_product_add";//商家
		} else {
			page = "product/p_product_add";//个人
		}
		mav.setViewName(page);
		mav.getModel().put("store","hover");
		mav.getModel().put("oneLevelCategories", oneLevelCategories);
		return mav;
	}

	@ResponseBody
	@RequestMapping(value="/add")
	public Boolean addOrUpdate(HttpServletRequest request,Product product) {
		Boolean flag = false;
		long memberId = super.getMemberId(request);
		if (memberId > 0 ) {
			try {
				product.setMemberId(memberId);
				long companyId = super.getCompanyId(request);
				if (companyId > 0) {
					product.setCompanyId(companyId);
				}
				product.setStatus(StatusUtil.CHECKING.getVal());
				if (product.getId() != null) {
					product.setUpdateTime(new Date());
					productService.updateProduct(product);
				} else {
					product.setAddTime(new Date());
					productService.saveProduct(product);
				}
				flag = true;
			} catch (Exception e) {
				LogMgr.writeErrorLog(e);
			}
		}
		return flag;
	}


	@RequestMapping(value="/update")
	public String update(HttpServletRequest request) {
		request.setAttribute("nav","myshop");
		return "product/product_update";
	}

	@RequestMapping(value="/toSuccess")
	public String toSuccess() {
		return "product/success";
	}


}
