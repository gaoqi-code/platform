package com.hiveview.action;

import com.google.common.collect.Maps;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;


@Controller
@RequestMapping("/testImg")
public class TestAction {

	@ResponseBody
	@RequestMapping(value="/test")
	public Map<String, Object>  test1(HttpServletRequest request) {
		Map<String, Object> result = Maps.newHashMap();
		result.put("succestt", true);
		result.put("url", "hhhhhhh");
		return result;
	}

}
