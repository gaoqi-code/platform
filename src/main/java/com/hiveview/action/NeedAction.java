package com.hiveview.action;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hiveview.entity.*;
import com.hiveview.service.ICategoryService;
import com.hiveview.service.INeedService;
import com.hiveview.util.LevelUtil;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import utils.StatusUtil;
import utils.log.LogMgr;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/member/need")
public class NeedAction extends BaseController{

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private INeedService needService;

    @RequestMapping(value="/list")
    public String list() {
        return "need/need_list";
    }
    @RequestMapping(value="/page")
    public ModelAndView page(HttpServletRequest request, ModelAndView mav) {
        Paging paging = super.getPaging(request);
        Need need = new Need();
        need.setMemberId(super.getMemberId(request));
        Page<Object> page = PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize());
            List<Need> needs =  needService.getNeedPage(need);
        paging.setTotalPages(page.getPages());
        mav.getModel().put("paging",paging);
        mav.getModel().put("needs",needs);
        mav.setViewName("need/paging");
        return mav;
    }

    @RequestMapping(value="/toAdd/{needId}")
    public ModelAndView toAdd(HttpServletRequest request,ModelAndView mav, @PathVariable("needId") Long needId) {
        Category category = new Category();
        category.setLevel(LevelUtil.ONE_LEVEL.getVal());
        //获得所有一级类目
        List<Category> oneLevelCategories = categoryService.getCategory(category);
        if (needId > 0 ) {
            Need need= needService.getNeedById(needId);
            Long categoryId = need.getClassId();
            //获得需求选择的类目
            //TODO 区分类目类型
            Category selectClass = categoryService.getCategoryById(categoryId);
            List<Category> twoLevelCategories = null;//二级类目
            List<Category> threeLevelCategories = null;//三级类目
            String code = selectClass.getCode();
            if (code!= null) {
                String[] ids = code.split("-");
                for (int i = 0; i < ids.length; i++) {
                    Long id = Long.parseLong(ids[i]);
                    if (i == 0 ) {
                        twoLevelCategories = categoryService.getSonCategory(id);
                        selectClass.setOneLevel(id);
                    }
                    if (i == 1) {
                        threeLevelCategories = categoryService.getSonCategory(id);
                        selectClass.setTwoLevel(id);
                    }
                    if (i == 2) {
                        selectClass.setThreeLevel(id);
                    }
                }
            }
            //获得选择的类目的下所有属性
            List<Attribute> attributes = categoryService.getCategoryAttribute(categoryId);
            //获得需求的属性
            if (CollectionUtils.isNotEmpty(attributes)) {
                List<Attribute> needAttrs =  needService.getNeedAttr(needId);
                if (CollectionUtils.isNotEmpty(needAttrs)) {
                    for (Attribute needAttr : needAttrs) {
                        for (Attribute attribute : attributes) {
                            if (attribute.getId() == needAttr.getClassId()) {
                                attribute.setValue(needAttr.getValue());
                            }
                        }
                    }
                }
                mav.getModel().put("attributes", attributes);
            }
            mav.getModel().put("selectClass", selectClass);
            mav.getModel().put("need", need);
            mav.getModel().put("twoLevelCategories", twoLevelCategories);
            mav.getModel().put("threeLevelCategories", threeLevelCategories);
        }
        mav.getModel().put("oneLevelCategories", oneLevelCategories);
        mav.setViewName("need/need_add");
        return mav;
    }

    @ResponseBody
    @RequestMapping(value="/add")
    public Boolean add(HttpServletRequest request,Need need) {
        Boolean flag = false;
        Member member = (Member) request.getSession().getAttribute("currentUser");
        long memberId = member.getId();
        try {
            need.setMemberId(memberId);
            long companyId = super.getCompanyId(request);
            if (companyId > 0) {
                need.setCompanyId(companyId);
            }
            need.setStatus(StatusUtil.CHECKING.getVal());
            if (need.getId() != null) {
                need.setUpdateTime(new Date());
                needService.updateNeed(need);
                needService.deleteAttributeByNeedId(need.getId());
            } else {
                need.setAddTime(new Date());
                need.setMemberType(member.getType());
                needService.saveNeed(need);
            }
            List<Attribute> attributes = need.getAttributes();
            if (CollectionUtils.isNotEmpty(attributes)) {
                Long needId = need.getId();
                for (Attribute attribute : attributes) {
                    attribute.setNeedId(needId);
                }
                needService.batchSaveAttr(attributes);
            }
            flag = true;
        } catch (Exception e) {
            LogMgr.writeErrorLog(e);
        }
        return flag;
    }
    @ResponseBody
    @RequestMapping(value="/operation")
    public Boolean operation(HttpServletRequest request,Need need) {
        Boolean flag = false;
        long memberId = super.getMemberId(request);
        if (memberId > 0  && need.getStatus() != null) {
            try {
                need.setMemberId(memberId);
                needService.updateNeed(need);
                flag = true;
            } catch (Exception e) {
                LogMgr.writeErrorLog(e);
            }
        }
        return flag;
    }

    @RequestMapping(value="/toSuccess")
    public String toSuccess() {
        return "need/success";
    }

    @RequestMapping(value="/memberNeedPage")
    public ModelAndView memberNeedPage(HttpServletRequest request, ModelAndView mav) {
        Paging paging = super.getPaging(request);
        Need need = new Need();
        need.setStatus(StatusUtil.CHECK_SUCCESS.getVal());
        need.setClassCode(super.getAdviserType(request));
        Page<Object> page = PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize());
        List<Need> needs =  needService.getOpendNeedPage(need);
        paging.setTotalPages(page.getPages());
        mav.getModel().put("paging",paging);
        mav.getModel().put("needs",needs);
        mav.setViewName("need/member_need_paging");
        return mav;
    }
}
