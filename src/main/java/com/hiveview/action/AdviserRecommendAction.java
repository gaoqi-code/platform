package com.hiveview.action;

import com.github.pagehelper.PageHelper;
import com.hiveview.entity.MemberRecommend;
import com.hiveview.entity.Paging;
import com.hiveview.service.IMemberRecommendService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import utils.RecommendPlate;
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
        memberRecommend.setPlate(RecommendPlate.HOME.getVal());
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

    @RequestMapping(value="/recommend")
    public ModelAndView recommend(HttpServletRequest request, ModelAndView mav) {
        String plate = request.getParameter("plate");//板块
        if (StringUtils.isNotEmpty(plate)) {
            Paging paging = super.getPaging(request);
            MemberRecommend memberRecommend = new MemberRecommend();
            memberRecommend.setPlate(Integer.parseInt(plate));
            memberRecommend.setStatus(StatusUtil.VALID.getVal());
            String adviserType = request.getParameter("adviserType");//顾问类型(类目code)
            if (StringUtils.isNotEmpty(adviserType)) {
                memberRecommend.setAdviserType(adviserType);
            }
            PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize(),false);
            List<MemberRecommend> adviserRecommends =  memberRecommendService.getMemberRecommendList(memberRecommend);
            mav.getModel().put("adviserRecommends",adviserRecommends);
        }
        mav.setViewName("memberRecommend/adviserRecommendPaging");
        return mav;
    }

    @RequestMapping(value="/recommendWithDetail")
    public ModelAndView recommendWithDetail(HttpServletRequest request, ModelAndView mav) {
        String plate = request.getParameter("plate");//板块
        if (StringUtils.isNotEmpty(plate)) {
            Paging paging = super.getPaging(request);
            MemberRecommend memberRecommend = new MemberRecommend();
            System.out.println(plate);
            memberRecommend.setPlate(Integer.parseInt(plate));
            memberRecommend.setStatus(StatusUtil.VALID.getVal());
            PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize(),false);
            List<MemberRecommend> adviserRecommends =  memberRecommendService.getMemberRecommendList(memberRecommend);
            mav.getModel().put("adviserRecommends",adviserRecommends);
        }
        mav.setViewName("memberRecommend/adviserRecommendPaging_detail");
        return mav;
    }
}
