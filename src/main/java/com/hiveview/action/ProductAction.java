package com.hiveview.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
