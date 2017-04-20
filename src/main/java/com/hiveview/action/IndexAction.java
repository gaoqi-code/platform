package com.hiveview.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/")
public class IndexAction {

	@RequestMapping(value="/test")
	public ModelAndView test(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("test");
		return mav;
	}

	@RequestMapping(value="/mType")
	public ModelAndView memberType(HttpServletRequest request,ModelAndView mav) {
		mav.setViewName("member/member_type");
		return mav;
	}

	@RequestMapping(value="/article")
	public ModelAndView article(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("article");
		return mav;
	}

	@RequestMapping(value="/index")
	public ModelAndView index(HttpServletRequest request, ModelAndView mav) {
		mav.getModel().put("cIndexNav","navCurrent");
		mav.setViewName("index");
		return mav;
	}


    @RequestMapping(value="/pass_update")
    public ModelAndView passUpdate(HttpServletRequest request, ModelAndView mav) {
        mav.setViewName("password_update");
        return mav;
    }

    /**
     * 顾问详情页面（店铺）
     * @param request
     * @param mav
     * @return
     */
    @RequestMapping(value="/adviser")
    public ModelAndView adviser(HttpServletRequest request, ModelAndView mav) {
        mav.setViewName("adviser");
        return mav;
    }

    /**
     * 产品详情页面
     * @param request
     * @param mav
     * @return
     */
    @RequestMapping(value="/product/{id}")
    public ModelAndView product(HttpServletRequest request, ModelAndView mav,@PathVariable("id")int id) {
        mav.setViewName("product");
        return mav;
    }

    /**
     * 需求详情页
     * @param request
     * @param mav
     * @return
     */
    @RequestMapping(value="/need")
    public ModelAndView need(HttpServletRequest request, ModelAndView mav) {
        mav.setViewName("need");
        return mav;
    }

	/**
	 * 找需求
	 * @param request
	 * @param mav
	 * @return
	 */
	@RequestMapping(value="/need/list")
	public ModelAndView needList(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("need_list");
		return mav;
	}

	/**
	 * 找顾问
	 * @param request
	 * @param mav
	 * @return
	 */
	@RequestMapping(value="/adviser/list")
	public ModelAndView adviserList(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("adviser_list");
		return mav;
	}

	/**
	 * 找产品
	 * @param request
	 * @param mav
	 * @return
	 */
	@RequestMapping(value="/product/list")
	public ModelAndView product(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("product_list");
		return mav;
	}

	@RequestMapping(value="/introduce")
	public ModelAndView introduce(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("introduce");
		return mav;
	}

	@RequestMapping(value="/toSuccess")
	public ModelAndView toSuccess(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("success");
		return mav;
	}


}
