package com.hiveview.action;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.StringUtil;
import com.hiveview.entity.Need;
import com.hiveview.entity.Paging;
import com.hiveview.service.INeedService;
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
@RequestMapping("/need")
public class OpenNeedAction extends BaseController{

    @Autowired
    private INeedService needService;

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
        need.setStatus(StatusUtil.VALID.getVal());
        Page<Object> page = PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize());
        List<Need> needs =  needService.getOpendNeedPage(need);
        paging.setTotalPages(page.getPages());
        mav.getModel().put("paging",paging);
        mav.getModel().put("needs",needs);
        mav.setViewName("openNeed/paging");
        return mav;
    }


    @RequestMapping(value="/detail/{needId}")
    public ModelAndView detail(ModelAndView mav,@PathVariable("needId") long needId) {

        Need need = needService.getNeedDetail(needId);

        mav.getModel().put("need", need);
        mav.setViewName("openNeed/detail");
        return mav;
    }

}
