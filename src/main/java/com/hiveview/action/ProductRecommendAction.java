package com.hiveview.action;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.StringUtil;
import com.hiveview.entity.Paging;
import com.hiveview.entity.ProductRecommend;
import com.hiveview.service.IProductRecommendService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import utils.StatusUtil;
import utils.log.LogMgr;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/productRecommend")
public class ProductRecommendAction extends BaseController {

    @Autowired
    private IProductRecommendService productRecommendService;


    @RequestMapping(value="/hotProduct")
    public ModelAndView hotProduct(HttpServletRequest request, ModelAndView mav) {
        Paging paging = super.getPaging(request);
        ProductRecommend productRecommend = new ProductRecommend();
        String classCode = request.getParameter("classCode");
        if (StringUtil.isNotEmpty(classCode)) {
                productRecommend.setClassCode(classCode);
        }
        productRecommend.setStatus(StatusUtil.VALID.getVal());
        PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize(),false);
        List<ProductRecommend> productRecommends =  productRecommendService.getHotProduct(productRecommend);
        mav.getModel().put("productRecommends",productRecommends);
        mav.setViewName("productRecommend/hotProductPage");
        return mav;
    }

    @ResponseBody
    @RequestMapping(value="/delete")
    public Boolean delete(HttpServletRequest request) {
        String recommendId = request.getParameter("recommendId");
        Boolean flag = false;
        if (StringUtils.isNotEmpty(recommendId)) {
            try {
                productRecommendService.deleteById(Long.parseLong(recommendId));
                flag = true;
            } catch (Exception e) {
                LogMgr.writeErrorLog(e);
            }
        }
        return flag;
    }


}
