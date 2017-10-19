package com.hiveview.action;

import com.hiveview.entity.Member;
import com.hiveview.entity.Paging;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BaseController {
    public BaseController() {
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }


    private String getCookieValue(HttpServletRequest request, String name) {
        Cookie[] cs = request.getCookies();
        if(cs != null) {
            Cookie[] arr$ = cs;
            int len$ = cs.length;

            for(int i$ = 0; i$ < len$; ++i$) {
                Cookie c = arr$[i$];
                if(c.getName().equals(name)) {
                    return c.getValue();
                }
            }
        }

        return null;
    }

//    public String getCurrentLoginUsername(HttpServletRequest request, boolean isMember) {
//        String username = null;
//        Cookie[] cs = request.getCookies();
//        if(cs != null) {
//            Cookie[] assertion = cs;
//            int len$ = cs.length;
//
//            for(int i$ = 0; i$ < len$; ++i$) {
//                Cookie c = assertion[i$];
//                if(isMember && c.getName().equals("MEMBERTGC") || !isMember && c.getName().equals("ADMINTGC")) {
//                    username = this.getCookieValue(request, c.getValue());
//                    break;
//                }
//            }
//        }
//
//        if(username == null) {
//            username = request.getRemoteUser();
//        }
//
//        return username;
//    }


    /**
     * 获得会员id
     * @param request
     * @return
     */
    public long getMemberId(HttpServletRequest request) {
        Member member = (Member) request.getSession().getAttribute("currentUser");
        Long memberId = null;
        if(member != null) {
//            memberId = assertion.getPrincipal().getAttributes().get("memberId");
            memberId = member.getId();
        }

        return memberId != null?memberId:-1L;
    }

    /**
     * 获得顾问类型
     * @param request
     * @return
     */
    public String getAdviserType(HttpServletRequest request) {
        Member member = (Member) request.getSession().getAttribute("currentUser");
        String adviserType = null;
        if(member != null) {
            adviserType = member.getAdviserType();
        }
        return adviserType;
    }

    /**
     * 获得会员类型
     * '会员类型:0普通会员，1顾问'
     * @param request
     * @return
     */
    public Integer getMemberType(HttpServletRequest request) {
        Member member = (Member) request.getSession().getAttribute("currentUser");
        Integer memberType = 0;
        if(member != null) {
            memberType = member.getType();
        }
        return memberType;
    }

    /**
     * 获得公司id
     * @param request
     * @return
     */
    public long getCompanyId(HttpServletRequest request) {
        Member member = (Member) request.getSession().getAttribute("currentUser");
        Long companyId = null;
        if(member != null) {
//            memberId = assertion.getPrincipal().getAttributes().get("memberId");
            companyId = member.getCompanyId();
        }

        return companyId != null?companyId:-1L;
    }

    /**
     * 获得paging对象用于分页
     * @param request
     * @return
     */
    public  Paging getPaging(HttpServletRequest request) {
        if(request == null) {
            return null;
        } else {
            Paging paging = new Paging();
            String pagesize = request.getParameter("pageSize");
            if (StringUtils.isNotEmpty(pagesize)) {
                paging.setPageSize(Integer.parseInt(pagesize));
            }
            String currentPage = request.getParameter("currentPage");
            if (StringUtils.isNotEmpty(currentPage)) {
                paging.setCurrentPage(Integer.parseInt(currentPage));
            }
//            IPagingDao pagingDao =  BeanUtil.getBean("pagingDao");
//            int total = pagingDao.getTableTotal(tableName);
//            if (total>0) {
//                paging.setTotalCount(total);
//            }
            return paging;
        }
    }



}
