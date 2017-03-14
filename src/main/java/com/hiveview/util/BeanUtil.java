package com.hiveview.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

@Service("beanUtil")
public class BeanUtil implements ApplicationContextAware {
    private static ApplicationContext applicationContext;

    public BeanUtil() {
    }

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        BeanUtil.applicationContext = applicationContext;
    }

    public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    public static <T> T getBean(String name) throws BeansException {
        return (T) applicationContext.getBean(name);
    }
//    public static <T> T getBean2(String name) throws BeansException {
//        WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
//        return (T)wac.getBean(name);
//    }
}
