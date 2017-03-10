package com.hiveview.action;

import com.hiveview.entity.Member;
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


    public long getMemberId(HttpServletRequest request) {
        Member member = (Member) request.getSession().getAttribute("currentUser");
        Long memberId = null;
        if(member != null) {
//            memberId = assertion.getPrincipal().getAttributes().get("memberId");
            memberId = member.getId();
        }

        return memberId != null?memberId:-1L;
    }


}
