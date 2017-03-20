package com.hiveview.action;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.StringUtil;
import com.hiveview.entity.Member;
import com.hiveview.entity.Paging;
import com.hiveview.service.IMemberService;
import com.hiveview.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		member.setStatus(StatusUtil.VALID.getVal());
		Page<Object> page = PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize());
		List<Member> members =  memberService.getOpendMemberPage(member);
		paging.setTotalPages(page.getPages());
		mav.getModel().put("paging",paging);
		mav.getModel().put("members",members);
		mav.setViewName("adviser/paging");
		return mav;
	}


	@RequestMapping(value="/detail/{memberId}")
	public ModelAndView detail(ModelAndView mav,@PathVariable("memberId") long memberId) {

		Member member = memberService.getMemberDetail(memberId);
		mav.getModel().put("member", member);
		mav.setViewName("adviser/detail");
		return mav;
	}

}
