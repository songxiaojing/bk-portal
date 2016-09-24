package com.mpe.portal.web.filter;


import com.mpe.portal.web.services.IAuthenticationService;
import com.mpe.portal.web.utils.app.AppReferent;
import com.mpe.portal.web.utils.app.AppServletContextUtils;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.slf4j.Logger;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 权限登录验证,控制请求，验证身份.
 * Created by martin on 4/26/16.
 */
public class AuthenticationFilter implements Filter {
    final private static Logger theLogger  = LoggerFactory.getLogger(AuthenticationFilter.class);
    final private static String LOGING_PAGE = "/sigin.jsp";

    private IAuthenticationService authenticationService=null;

    private FilterConfig _config;


    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        //根据认证的情况处理 :200认证通过/401需要用户重新登录/403请求禁止
        switch (checkAuthentication(request)) {
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

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

        this._config = filterConfig;

        authenticationService= (IAuthenticationService) AppServletContextUtils.getSpringApplicationContext().getBean("AuthenticationServiceImpl");
    }

    /**
     * 查询请求是否通过认证.
     *
     * @param request
     * @return
     */
    private int checkAuthentication(ServletRequest request) {

        //#1 是否存在用户信息在session中
        if (((HttpServletRequest) request).getSession().getAttribute(AppReferent.session_current_user.getValue()) != null) {
            return 200;
        }
       return authenticationService.hasAuthentication((HttpServletRequest) request);
    }

    /**
     * 需要用户重新认证 、401 Unauthorized 未授权.
     *
     * @throws IOException
     *
     */
    private void RedirectLoginPage(ServletRequest request, ServletResponse response) throws IOException {

        String loginPath = ((HttpServletRequest) request).getContextPath();
        if (loginPath.length() == 0 || loginPath.endsWith("/") == true) {
            loginPath = LOGING_PAGE;
        } else {
            loginPath = loginPath + LOGING_PAGE;
        }
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
}