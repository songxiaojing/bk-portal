package com.mpe.portal.web.utils.app;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;


/**
 * Created by byw-m on 2016/7/18.
 * 系统ServletContext持有类
 */
public class AppServletContextUtils {
    /**
     * APPLICATION作用域
     */
    private static ServletContext APP_SERVLET_CONTEXT = null;

    /**
     * 取得APPLICATION
     * @return ServletContext
     */
    public static ServletContext getServletContext() {

        return APP_SERVLET_CONTEXT;
    }

    /**
     * 设置APPLICATION作域
     * @param servletContext ServletContext
     */
    public static void setServletContext(ServletContext servletContext) {

        APP_SERVLET_CONTEXT = servletContext;
    }

    /**
     * 取得spring的bean Context.
     * @return WebApplicationContext
     */
    public static WebApplicationContext getSpringApplicationContext() {

        if (APP_SERVLET_CONTEXT == null) {
            return null;
        }

        return WebApplicationContextUtils.getWebApplicationContext(APP_SERVLET_CONTEXT);

    }

}
