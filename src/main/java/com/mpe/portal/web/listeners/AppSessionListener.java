package com.mpe.portal.web.listeners;




import com.mpe.portal.web.services.IApplicationService;
import com.mpe.portal.web.utils.app.AppServletContextUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;



public class AppSessionListener implements HttpSessionListener {

    private Logger logger = LoggerFactory.getLogger(AppSessionListener.class);

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
//        ApplicationServiceImpl

        IApplicationService service = (IApplicationService) AppServletContextUtils.getSpringApplicationContext().getBean("ApplicationServiceImpl");
        if (service != null) {
            HttpSession session = httpSessionEvent.getSession();
            //
//            SysUserLoginRecord sysUserLoginRecord = (SysUserLoginRecord) session.getAttribute(AppReferent.session_current_loginRecord.getValue());
//            session.removeAttribute(AppReferent.session_current_loginRecord.getValue());
//            if (sysUserLoginRecord != null) {
//                service.recordUserLogout(sysUserLoginRecord);
//            }
        }
    }
}