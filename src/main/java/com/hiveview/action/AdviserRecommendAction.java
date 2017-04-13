package com.hiveview.action;

import com.github.pagehelper.PageHelper;
import com.hiveview.entity.MemberRecommend;
import com.hiveview.entity.Paging;
import com.hiveview.service.IMemberRecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import utils.StatusUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/adviserRecommend")
public class AdviserRecommendAction extends BaseController {

    @Autowired
    private IMemberRecommendService memberRecommendService;

    @RequestMapping(value="/list")
    public ModelAndView page(HttpServletRequest request, ModelAndView mav) {
        String type = request.getParameter("type");
        Paging paging = super.getPaging(request);
        MemberRecommend memberRecommend = new MemberRecommend();
        memberRecommend.setStatus(StatusUtil.VALID.getVal());
        PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize(),false);
        List<MemberRecommend> memberRecommends =  memberRecommendService.getMemberRecommendList(memberRecommend);
        mav.getModel().put("memberRecommends",memberRecommends);
        String page ;
        if ("adviser".equals(type)) {
            page = "memberRecommend/memberRecommendPaging";
        }else{
            page = "memberRecommend/serviceProviderPaging";
        }
        mav.setViewName(page);
        return mav;
    }


}