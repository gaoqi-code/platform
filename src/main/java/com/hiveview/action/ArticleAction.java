package com.hiveview.action;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.common.collect.Maps;
import com.hiveview.entity.Article;
import com.hiveview.entity.Paging;
import com.hiveview.service.IArticleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import utils.HtmlToText;
import utils.StatusUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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

    @RequestMapping(value="/indexPage")
    public ModelAndView indexPage(ModelAndView mav,HttpServletRequest request) {
        Paging paging = super.getPaging(request);
        Article article = new Article();
        article.setStatus(StatusUtil.VALID.getVal());
        Page<Object> page = PageHelper.startPage(1, 4,false);
        List<Article> articles =  articleService.getRecommendList(article);
        //替换HTML标签
        Optional.ofNullable(articles).ifPresent( as ->
                as.stream().forEach(a -> {
                    String content = a.getContent();
                    if (StringUtils.isNotEmpty(content)) {
                        a.setContent(HtmlToText.trimHtml2Txt(content,null));
                    }
                })
        );
        paging.setTotalPages(page.getPages());
        mav.getModel().put("articles",articles);
        mav.setViewName("article/recommendArticle");
        return mav;
    }


}
