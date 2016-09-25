package com.mpe.portal.web.filter;


import com.mpe.portal.web.utils.Assert;
import com.mpe.portal.web.utils.app.AppReferent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 权限登录验证,控制请求，验证身份.
 * Created by martin on 4/26/16.
 */
public class AuthenticationFilter implements Filter {
    final private static Logger theLogger = LoggerFactory.getLogger(AuthenticationFilter.class);
    final private static String LOGING_PAGE = "/sigin.jsp";


    private List<String> _notCheckResource = new ArrayList<String>();
    /**
     * 定义系统中哪些URL可以跳过权限验证
     */

    private List<String> _notCheckServlets = new ArrayList<String>();

    private FilterConfig _config;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

        this._config = filterConfig;
        //
        String notCheckResource = filterConfig.getInitParameter("notCheckResource");
        String notCheckServlets = filterConfig.getInitParameter("notCheckServlets");
        if (!Assert.isEmptyString(notCheckResource)) {
            this._notCheckResource.addAll(Arrays.asList(notCheckResource.split(",")));
        }
        if (!Assert.isEmptyString(notCheckServlets)) {
            this._notCheckServlets.addAll(Arrays.asList(notCheckServlets.split(",")));
        }
    }

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        //根据认证的情况处理 :200认证通过/401需要用户重新登录/403请求禁止
        switch (checkAuthentication((HttpServletRequest) request)) {
            case 200:
                break;
            case 401:
                this.RedirectLoginPage(request, response);
                return;
            case 403:
                this.sendResponse(response, HttpStatus.FORBIDDEN);
                return;
            default:
                this.sendResponse(response, HttpStatus.BAD_REQUEST);
                return;
        }
        //通过认证
        chain.doFilter(request, response);
    }


    /**
     * 查询请求是否通过认证.
     *
     * @param request
     * @return
     */
    private int checkAuthentication(HttpServletRequest request) {

        //#1 是否存在用户信息在session中
        if (request.getSession().getAttribute(AppReferent.session_current_user.getValue()) != null) {
            return 200;
        }

        //#1请求的资源目标
        String requestTarget = request.getServletPath();
        //#2检查请求的目标是否为可以跳过检查的资源或Servlet
        if (isUnCheckResource(requestTarget) || isUnCheckServlet(requestTarget)) {
            return 200;
        }
        //直接要求登录
        return 401;

    }

    /**
     * 需要用户重新认证 、401 Unauthorized 未授权.
     *
     * @throws IOException
     */
    private void RedirectLoginPage(ServletRequest request, ServletResponse response) throws IOException {

        String loginPath = ((HttpServletRequest) request).getContextPath();
        if (loginPath.length() == 0 || loginPath.endsWith("/") == true) {
            loginPath = LOGING_PAGE;
        } else {
            loginPath = loginPath + LOGING_PAGE;
        }
        theLogger.info("Redirect to Login for " + ((HttpServletRequest) request).getServletPath());
        ((HttpServletResponse) response).sendRedirect(loginPath);

    }

    /**
     * 向请求发送403. 403——请求不允许
     */
    private void sendResponse(ServletResponse response, HttpStatus code) {

        PrintWriter pw = null;
        try {
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.setStatus(code.value());
            pw = response.getWriter();
            pw.flush();
        } catch (IOException e) {
            theLogger.error(code.getReasonPhrase(), e);
        } finally {
            if (pw != null) {
                pw.close();
            }
        }
    }

    /**
     * 检查请求资源是否为跳过检查的资源.
     *
     * @param servletPath String
     * @return boolean
     */
    private boolean isUnCheckResource(String servletPath) {

        for (int i = 0; i < this._notCheckResource.size(); i++) {
            if (servletPath.endsWith(this._notCheckResource.get(i))) {
                return true;
            }
        }
        return false;
    }

    /**
     * 检查请求资源是否为跳过检查的servlets.
     *
     * @param serverPath String
     * @return boolean
     */
    private boolean isUnCheckServlet(String serverPath) {

        if (this._notCheckServlets.contains(serverPath)) {
            return true;
        }
        return false;
    }
}