package com.hiveview.action;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.StringUtil;
import com.hiveview.entity.*;
import com.hiveview.service.ICategoryService;
import com.hiveview.service.ICompanyService;
import com.hiveview.service.IProductService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import utils.IssueType;
import utils.StatusUtil;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by huxunqiang on 17/3/19.
 */
@Controller
@RequestMapping("/product")
public class OpenProductAction extends BaseController{

    @Autowired
    private IProductService productService;
    @Autowired
    private ICompanyService companyService;

    @Autowired
    private ICategoryService iCategoryService;
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
        LevelCategoriesDto levelCategories = categoryService.getLevelCategory(categoryCode, IssueType.PRODUCT.getVal());
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
        mav.setViewName("openProduct/product_list");
        mav.getModel().put("cProductNav","navCurrent");
        return mav;
    }


    @RequestMapping(value="/page")
    public ModelAndView page(HttpServletRequest request, ModelAndView mav) {
        Paging paging = super.getPaging(request);
        Product product = new Product();
        String keyword = request.getParameter("keyword");
        if (StringUtil.isNotEmpty(keyword)) {
            product.setTitle(keyword);
        }
        String areaCode = request.getParameter("areaCode");
        if (StringUtil.isNotEmpty(areaCode)) {
            product.setAreaCode(areaCode);
        }
        String classCode = request.getParameter("classCode");
        if (StringUtil.isNotEmpty(classCode)) {
            product.setClassCode(classCode);
        }
        product.setStatus(StatusUtil.CHECK_SUCCESS.getVal());
        Page<Object> page = PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize());
        List<Product> products =  productService.getOpendProductPage(product);
        paging.setTotalPages(page.getPages());
        mav.getModel().put("paging",paging);
        mav.getModel().put("products",products);
        Set<Long> cNameSet = new HashSet<Long>();
        for (Product p: products) {
            cNameSet.add(p.getCompanyId());
        }
        if(cNameSet.size()>0){
            List<Map<String,Object>> companyList = companyService.getCompanyByCompanyIds(cNameSet);
            mav.getModel().put("companyInfos",JSON.toJSON(companyList));
        }
        mav.setViewName("openProduct/paging");
        return mav;
    }


    @RequestMapping(value="/detail/{productId}")
    public ModelAndView detail(ModelAndView mav,@PathVariable("productId") long productId) {

        Product product = productService.getProductDetail(productId);
        MemberRecommend memberRecommend1= new MemberRecommend();


        mav.getModel().put("product", product);
        mav.setViewName("openProduct/detail");
        return mav;
    }

    @RequestMapping(value="/productIntroduce/{code}")
    public String productIntroduce(HttpServletRequest request,@PathVariable("code") String code,UserNeed userNeed){
        //获得所有分类信息
        List<Category> list = iCategoryService.getListByCode(code);
        System.out.println(list.size());
        request.setAttribute("cateList",list);
        request.setAttribute("categoryCode",code);
        return "openProduct/product_introduce";
    }


    @RequestMapping(value="/productIntroduce")
    public ModelAndView serviceProvider(HttpServletRequest request, ModelAndView mav) {
        Map<String, Object> model = mav.getModel();
        Paging paging = super.getPaging(request);
        Product product = new Product();
        String classCode = request.getParameter("classCode");
        if (StringUtil.isNotEmpty(classCode)) {
            product.setClassCode(classCode);
        }
        product.setStatus(StatusUtil.CHECK_SUCCESS.getVal());
        Page<Object> page = PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize());
        List<Product> products =  productService.getProductIntroduce(product);
        paging.setTotalPages(page.getPages());
        model.put("paging",paging);
        model.put("products",products);
        mav.setViewName("openProduct/productIntroducePage");
        return mav;
    }

}
