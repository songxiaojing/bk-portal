package com.mpe.portal.web.listeners;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.joran.JoranConfigurator;
import com.mpe.portal.web.utils.app.AppServletContextUtils;
import com.mpe.portal.web.utils.app.AppReferent;
import com.mpe.portal.web.utils.Assert;
import org.slf4j.LoggerFactory;

import com.mpe.portal.web.utils.Utils;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.ArrayList;


public class AppLogListener implements ServletContextListener {


    @Override
    public void contextDestroyed(ServletContextEvent arg0) {

    }

    @Override
    public void contextInitialized(ServletContextEvent arg0) {
        //填写配置文件
        fillParameterInSystem(arg0);
        //设置APPLICATION的引用
        AppServletContextUtils.setServletContext(arg0.getServletContext());
        //取得LOGGING配置文件名称
        String loggingCfgPath = arg0.getServletContext().getInitParameter(AppReferent.app_cfg_log_path.getValue());
        if (Assert.isEmptyString(loggingCfgPath) == true) {
            System.out.println(AppReferent.app_cfg_log_path.getValue() + " is invalidate.");
            System.exit(1);
        }
        //
        try {
            ArrayList<Class<?>> frameworkClassList = new ArrayList<Class<?>>();
            //初始化LOGGING
            LoggerContext logContext = (LoggerContext) LoggerFactory.getILoggerFactory();
            //
            JoranConfigurator configurator = new JoranConfigurator();
            configurator.setContext(logContext);
            logContext.reset();
            //
            configurator.doConfigure(this.getClass().getClassLoader().getResourceAsStream(loggingCfgPath.trim()));
            System.out.println("Platform Logger is set with " + loggingCfgPath);
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(0);
        }


    }

    /**
     * 将参数写入系统中, 根据WEB.XML中的context-param参数填充到System中.
     *
     * @param sce
     */
    private void fillParameterInSystem(ServletContextEvent sce) {
        //设置启动时间
        Utils.setSystemParameter(AppReferent.app_run_startup_time.getValue(), String.valueOf(System.currentTimeMillis()));
        //LOGGING配置文件
        Utils.setSystemParameter(AppReferent.app_cfg_log_path.getValue(), sce.getServletContext().getInitParameter(AppReferent.app_cfg_log_path.getValue()));
        //Services配置文件
        Utils.setSystemParameter(AppReferent.app_cfg_service_Path.getValue(), sce.getServletContext().getInitParameter(AppReferent.app_cfg_service_Path.getValue()));

    }
}
