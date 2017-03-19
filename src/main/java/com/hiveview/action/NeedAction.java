package com.hiveview.action;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hiveview.entity.Category;
import com.hiveview.entity.Need;
import com.hiveview.entity.Paging;
import com.hiveview.service.ICategoryService;
import com.hiveview.service.INeedService;
import com.hiveview.util.LevelUtil;
import com.hiveview.util.StatusUtil;
import com.hiveview.util.log.LogMgr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
        need.setStatus(StatusUtil.VALID.getVal());
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
        List<Category> oneLevelCategories = categoryService.getCategory(category);
        if (needId > 0 ) {
            category.setLevel(LevelUtil.TWO_LEVEL.getVal());
            List<Category> twoLevelCategories = categoryService.getCategory(category);
            category.setLevel(LevelUtil.THREE_LEVEL.getVal());
            List<Category> threeLevelCategories = categoryService.getCategory(category);
            Long memberId = super.getMemberId(request);
            Need need= needService.getNeedByIdAndMId(needId,memberId);
            Category selectClass = categoryService.getCategoryById(need.getClassId());
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
        long memberId = super.getMemberId(request);
        if (memberId > 0 ) {
            try {
                need.setMemberId(memberId);
                long companyId = super.getCompanyId(request);
                if (companyId > 0) {
                    need.setCompanyId(companyId);
                }
                need.setAddTime(new Date());
                if (need.getId() != null) {
                    needService.updateNeed(need);
                } else {
                    needService.saveNeed(need);
                }
                flag = true;
            } catch (Exception e) {
                LogMgr.writeErrorLog(e);
            }
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

}
