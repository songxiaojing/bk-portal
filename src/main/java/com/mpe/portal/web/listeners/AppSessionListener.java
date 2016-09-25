package com.mpe.portal.web.listeners;


import com.mpe.portal.web.resources.modules.MetricLoginRecord;
import com.mpe.portal.web.services.IApplicationService;
import com.mpe.portal.web.utils.app.AppReferent;
import com.mpe.portal.web.utils.app.AppServletContextUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.Date;


public class AppSessionListener implements HttpSessionListener {

    final private static Logger theLogger = LoggerFactory.getLogger(AppSessionListener.class);

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {

        IApplicationService service = (IApplicationService) AppServletContextUtils.getSpringApplicationContext().getBean("ApplicationServiceImpl");
        if (service != null) {
            HttpSession session = httpSessionEvent.getSession();
            //
            MetricLoginRecord sysUserLoginRecord = (MetricLoginRecord) session.getAttribute(AppReferent.session_current_loginRecord.getValue());
            session.removeAttribute(AppReferent.session_current_loginRecord.getValue());
            if (sysUserLoginRecord != null) {
                sysUserLoginRecord.setLogoutType("超时退出");
                sysUserLoginRecord.setLogoutAt(new Date());
                service.recordUserLogout(sysUserLoginRecord);
                theLogger.info("System administrator's session is time out.");
            }
        }
    }
}