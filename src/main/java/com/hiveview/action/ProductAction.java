package com.hiveview.action;

import com.hiveview.service.IDeveloperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/member/product")
public class ProductAction {

	@RequestMapping(value="/list")
	public String show(HttpServletRequest request) {
		request.setAttribute("nav","myshop");
		return "product/product_list";
	}

	@RequestMapping(value="/add")
	public String add(HttpServletRequest request) {
		request.setAttribute("nav","myshop");
		return "product/product_add";
	}

	@RequestMapping(value="/update")
	public String update(HttpServletRequest request) {
		request.setAttribute("nav","myshop");
		return "product/product_update";
	}

}
