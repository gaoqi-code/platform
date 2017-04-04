package com.hiveview.action;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.StringUtil;
import com.google.common.collect.Maps;
import com.hiveview.entity.Article;
import com.hiveview.entity.Paging;
import com.hiveview.service.IArticleService;
import org.apache.commons.lang.StringUtils;
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
import java.util.Map;

@Controller
@RequestMapping("/article")
public class ArticleAction extends BaseController {

    @Autowired
    private IArticleService articleService;

    @ResponseBody
    @RequestMapping(value="/list")
    public Map<String,Object> list(HttpServletRequest request) {
        Paging paging = super.getPaging(request);
        Article article = new Article();
        article.setStatus(StatusUtil.VALID.getVal());
        Page<Object> page = PageHelper.startPage(1, 5);
        List<Article> articles =  articleService.getArticleList(article);
        paging.setTotalPages(page.getPages());
        Map<String, Object> result = Maps.newHashMap();
        result.put("articles",articles);
        return result;
    }

    @RequestMapping(value="/detail/{articleId}")
    public ModelAndView toAdd(ModelAndView mav, @PathVariable("articleId")long articleId) {
        if (articleId >0) {
            articleService.addPageView(articleId);//添加浏览量
            Article article = articleService.getArticleById(articleId);
            mav.getModel().put("article", article);
        }
        mav.setViewName("article/detail");
        return mav;
    }


}
