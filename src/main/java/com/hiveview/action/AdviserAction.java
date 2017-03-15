package com.hiveview.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/member/aaa")
public class AdviserAction {

	@RequestMapping(value="/list")
	public ModelAndView list(HttpServletRequest request, ModelAndView mav) {
		request.setAttribute("nav","center");
		mav.setViewName("need/need_list");

		return mav;
	}

	@RequestMapping(value="/add")
	public ModelAndView add(HttpServletRequest request, ModelAndView mav) {
		request.setAttribute("nav","center");
		mav.setViewName("need/need_add");
		return mav;
	}

	@RequestMapping(value="/update")
	public ModelAndView update(HttpServletRequest request, ModelAndView mav) {
		request.setAttribute("nav","center");
		mav.setViewName("need/need_update");
		return mav;
	}

}
