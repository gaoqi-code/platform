package com.hiveview.action;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.StringUtil;
import com.google.common.collect.Maps;
import com.hiveview.entity.*;
import com.hiveview.service.ICategoryService;
import com.hiveview.service.IMemberRecommendService;
import com.hiveview.service.IMemberService;
import com.hiveview.service.INeedService;
import com.hiveview.util.Data;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import utils.IssueType;
import utils.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

/**
 * Created by huxunqiang on 17/3/19.
 */
@Controller
@RequestMapping("/need")

public class OpenNeedAction extends BaseController{
    @Autowired
    private IMemberRecommendService memberRecommendService;
    @Autowired
    private INeedService needService;
    @Autowired
    private IMemberService memberService;
    @Autowired
    private ICategoryService categoryService;

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
        //得到所需要的类目
        String categoryCode = request.getParameter("code");
        if (StringUtils.isNotEmpty(categoryCode)) {
            mav.getModel().put("categoryCode", categoryCode);
        }
        LevelCategoriesDto levelCategories = categoryService.getLevelCategory(categoryCode, IssueType.NEED.getVal());
        List<Category> oneLevelCategories = levelCategories.getOneLevelCategories();
        if (CollectionUtils.isNotEmpty(oneLevelCategories)) {
            mav.getModel().put("oneLevelCategories", oneLevelCategories);
            List<Category> twoLevelCategories = levelCategories.getTwoLevelCategories();
            if (CollectionUtils.isNotEmpty(twoLevelCategories)) {
                mav.getModel().put("twoLevelCategories", twoLevelCategories);
                List<Category> threeLevelCategories = levelCategories.getThreeLevelCategories();
                if (CollectionUtils.isNotEmpty(threeLevelCategories)) {
                    mav.getModel().put("threeLevelCategories", threeLevelCategories);
                }
            }
        }
        mav.getModel().put("cNeedNav","navCurrent");
        mav.setViewName("openNeed/need_list");
        return mav;
    }
    @RequestMapping(value="/page")
    public ModelAndView page(HttpServletRequest request, ModelAndView mav) {
        Paging paging = super.getPaging(request);
        Need need = new Need();
        String keyword = request.getParameter("keyword");
        if (StringUtil.isNotEmpty(keyword)) {
            need.setTitle(keyword);
        }
        String areaCode = request.getParameter("areaCode");
        if (StringUtil.isNotEmpty(areaCode)) {
            need.setAreaCode(areaCode);
        }
        String classCode = request.getParameter("classCode");
        if (StringUtil.isNotEmpty(classCode)) {
            need.setClassCode(classCode);
        }
        need.setStatus(StatusUtil.CHECK_SUCCESS.getVal());
        Page<Object> page = PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize());
        long memberId = super.getMemberId(request);
        if (memberId > 0) {
            need.setOpenShow(true);
            need.setMemberId(memberId);
        }
        List<Need> needs =  needService.getOpendNeedPage(need);
        paging.setTotalPages(page.getPages());
        mav.getModel().put("paging",paging);
        mav.getModel().put("needs",needs);
        mav.setViewName("openNeed/paging");
        return mav;
    }
    @RequestMapping(value="/page1")
    public ModelAndView page1(HttpServletRequest request, ModelAndView mav) {
        Paging paging = super.getPaging(request);
        Need need = new Need();
        String keyword = request.getParameter("keyword");
        if (StringUtil.isNotEmpty(keyword)) {
            need.setTitle(keyword);
        }
        String areaCode = request.getParameter("areaCode");
        if (StringUtil.isNotEmpty(areaCode)) {
            need.setAreaCode(areaCode);
        }
        String classCode = request.getParameter("classCode");
        if (StringUtil.isNotEmpty(classCode)) {
            need.setClassCode(classCode);
        }
        need.setStatus(StatusUtil.CHECK_SUCCESS.getVal());
        Page<Object> page = PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize());
        long memberId = super.getMemberId(request);
        if (memberId > 0) {
            need.setOpenShow(true);
            need.setMemberId(memberId);
        }
        List<Need> needs =  needService.getOpendNeedPage(need);
        paging.setTotalPages(page.getPages());
        mav.getModel().put("paging",paging);
        mav.getModel().put("needs",needs);
        mav.setViewName("openNeed/paging123");
        return mav;
    }

    @RequestMapping(value="/pageIndex")
    public ModelAndView pageIndex(HttpServletRequest request, ModelAndView mav) {
        Paging paging = super.getPaging(request);
        Need need = new Need();
        String keyword = request.getParameter("keyword");

        if (StringUtil.isNotEmpty(keyword)) {
            need.setTitle(keyword);
        }
        String areaCode = request.getParameter("areaCode");

        if (StringUtil.isNotEmpty(areaCode)) {
            need.setAreaCode(areaCode);
        }
        String classCode = request.getParameter("classCode");

        if (StringUtil.isNotEmpty(classCode)) {
            need.setClassCode(classCode);
        }
        String memberType = request.getParameter("memberType");


        if (StringUtil.isNotEmpty(memberType)) {
            need.setMemberType(Integer.valueOf(memberType));
        }
        need.setStatus(StatusUtil.CHECK_SUCCESS.getVal());
       Integer type =need.getMemberType();


        //不进行count查询，第三个参数设为false
        Page<Object> page = PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize(),false);
        List<Need> needs =  needService.getOpendNeedPage(need);

        paging.setTotalPages(page.getPages());
        mav.getModel().put("paging",paging);
        mav.getModel().put("needs",needs);
        mav.getModel().put("type",type);

        mav.setViewName("openNeed/paging_index");
        return mav;
    }

    @RequestMapping(value="/detail/{needId}")
    public ModelAndView detail(ModelAndView mav,@PathVariable("needId") long needId,HttpServletRequest request) {
        String view ="openNeed/detail";
        needService.addHitsByNid(needId);
        Need need = needService.getNeedDetail(needId);
        MemberRecommend memberRecommend = new MemberRecommend();

        memberRecommend.setStatus(StatusUtil.VALID.getVal());

        List<MemberRecommend> memberRecommends =  memberRecommendService.getMemberRecommendList(memberRecommend);



        Integer chargeType = need.getChargeType();
        if (chargeType != null && chargeType == StatusUtil.COLLECT_FEE.getVal()) {
            Long memberId =super.getMemberId(request);
            if (memberId != need.getMemberId()) {//不是自己发布的需求
                if (!needService.isViewed(memberId, needId)) {
                    view ="redirect:/need/toSearch.html";
                }
            }
        }
        mav.getModel().put("need", need);
        mav.getModel().put("memberRecommends",memberRecommends);


        mav.setViewName(view);
        return mav;
    }

    @RequestMapping(value="/useViewCount/{needId}")
    public ModelAndView useViewCount(HttpServletRequest request,ModelAndView mav,@PathVariable("needId") long needId) {
        String view;
        Long memberId =super.getMemberId(request);
        Member member = memberService.getMemberById(memberId);

        Integer viewCount = member.getNeedViewCount();
        if (viewCount != null && viewCount > 0) {
            member.setNeedViewCount(viewCount - 1);
            memberService.updateMember(member);
            needService.addMemberViewNeedRecord(memberId, needId);
            view = "redirect:/need/detail/"+needId+".html";
        } else {
            view = "redirect:/need/toSearch.html";
        }
        mav.setViewName(view);

        return mav;
    }
    /**
     * 获得会员需求点击数
     * @param needId
     * @return 0可以直接观看此需求，1付费需求需要先登陆验证，2 返回会员剩余查看次数
     */
    @ResponseBody
    @RequestMapping(value="/getMemberNeedHits/{needId}")
    public Map<String,Object> getMemberNeedHits(HttpServletRequest request,
                                                @PathVariable("needId") long needId) {
        Map<String, Object> result = Maps.newHashMap();
        int flag = 0;
        Need need = needService.getNeedDetail(needId);
        if (need != null) {
            Integer chargeType = need.getChargeType();
            if (chargeType != null && chargeType == StatusUtil.COLLECT_FEE.getVal()) {
                Long memberId = super.getMemberId(request);
                if (memberId > 0) {
                    if (memberId != need.getMemberId()) {//不是自己发布的需求
                        Map<String, Object> resultMap = memberService.getViewNeedCount(memberId, needId);
                        if (resultMap.get("viewId") == null) {
                            flag = 2;
                            result.put("count",resultMap.get("needViewCount"));
                        }
                    }
                } else {
                    flag = 1;
                }
            }
        }
        result.put("flag", flag);
        return result;
    }

    /**
     * 用户留言
     * @return
     */
    @RequestMapping(value="/liuyan")
    public @ResponseBody Data liuyan(HttpServletRequest request,UserNeed userNeed){
        Data data = new Data();
        try {
            if(null==userNeed||userNeed.getMobile()==null){
                data.setCode(501);
                data.setMsg("手机号不完整！");
            }
            userNeed.setIsContact(0);
            userNeed.setMemberId(super.getMemberId(request));
            needService.addUserNeed(userNeed);
            data.setCode(200);
            return data;
        }catch (Exception e){
            data.setCode(500);
            data.setMsg(e.getMessage());
            return data;
        }
    }



}
