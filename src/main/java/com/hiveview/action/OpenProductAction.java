package com.hiveview.action;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.StringUtil;
import com.hiveview.entity.Need;
import com.hiveview.entity.Paging;
import com.hiveview.entity.Product;
import com.hiveview.service.IProductService;
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
@RequestMapping("/product")
public class OpenProductAction extends BaseController{

    @Autowired
    private IProductService productService;

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
        mav.setViewName("openProduct/product_list");
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
        product.setStatus(StatusUtil.VALID.getVal());
        Page<Object> page = PageHelper.startPage(paging.getCurrentPage(), paging.getPageSize());
        List<Product> products =  productService.getOpendProductPage(product);
        paging.setTotalPages(page.getPages());
        mav.getModel().put("paging",paging);
        mav.getModel().put("products",products);
        mav.setViewName("openProduct/paging");
        return mav;
    }


    @RequestMapping(value="/detail/{productId}")
    public ModelAndView detail(ModelAndView mav,@PathVariable("productId") long productId) {

        Product product = productService.getProductDetail(productId);

        mav.getModel().put("product", product);
        mav.setViewName("openProduct/detail");
        return mav;
    }

}
