package com.mpe.portal.web.filter;


import com.mpe.portal.web.resources.modules.MetricWebVisitRecord;
import com.mpe.portal.web.services.IApplicationService;
import com.mpe.portal.web.utils.Assert;
import com.mpe.portal.web.utils.app.AppServletContextUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 权限登录验证,控制请求，验证身份.
 * Created by martin on 4/26/16.
 */
public class VisitMonitorFilter implements Filter {

    final private static Logger theLogger = LoggerFactory.getLogger(VisitMonitorFilter.class);


    private IApplicationService applicationService = null;

    private List<String> monitorResource = new ArrayList<String>();

    private FilterConfig config;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

        this.config = filterConfig;
        applicationService = (IApplicationService) AppServletContextUtils.getSpringApplicationContext().getBean("ApplicationServiceImpl");

        String monitorResource = filterConfig.getInitParameter("monitorResource");
        if (!Assert.isEmptyString(monitorResource)) {
            this.monitorResource.addAll(Arrays.asList(monitorResource.split(",")));
        }

        theLogger.info("Visit Monitor works on " + monitorResource);
    }

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        //#1请求的资源目标
        String requestTarget = httpRequest.getServletPath();
        for (int i = 0; i < this.monitorResource.size(); i++) {
            if (requestTarget.endsWith(this.monitorResource.get(i))) {
                recordVisit(httpRequest);
                break;
            }
        }

        chain.doFilter(request, response);

    }


    /**
     * 查询请求是否通过认证.
     *
     * @param request
     * @return
     */
    private void recordVisit(HttpServletRequest request) {
        IApplicationService service = (IApplicationService) AppServletContextUtils.getSpringApplicationContext().getBean("ApplicationServiceImpl");
        if (service != null) {

            //

            service.recordVisitItem(request);
        }
        theLogger.info("Visit Monitor>>" + request.getServletPath());
    }
}