package com.hiveview.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/about")
public class AboutAction {

	@RequestMapping(value="/{name}")
	public String toPage(@PathVariable String name) {
		return "about/"+name;
	}


}
