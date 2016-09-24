package com.mpe.portal.web.utils.app;
/**
 * Created by byw-m on 2016/7/18.
 * 定义应用中常用到的一些常量KEY
 */
public enum AppReferent {
    /**
     * 应用使用的日志配置文件路径
     */
    app_cfg_log_path("app.cfg.log.path"),
    /**
     * 应用平台服务的配置文件路径
     */
    app_cfg_service_Path("app.cfg.service.path"),
    /**
     * 应用启动时间
     */
    app_run_startup_time("app.run.startup.time"),
    /**
     * 应用系统用户，系统数据的创建者
     */
    app_run_default_user("root"),
    /**
     * 当前登录用户在SESSION中用户信息的变量名
     */
    session_current_user("session.current.user"),
    /**
     * 当前登录用户在SESSION中客户信息BEAN的变量名
     */
    session_current_customer("session.current.customer"),
    /**
     * 当前登录用户在SESSION中的登录记录BEAN的变量名
     */
    session_current_loginRecord("session.current.loginRecord"),
    /**
     * 当前登录用户在SESSION中的权限资源BEAN的变量名
     */
    session_current_permissions("session.current.permissions");

    private final String _parameterName;

    private AppReferent(String parameterName) {

        this._parameterName = parameterName;
    }

    public String getValue() {

        return this._parameterName;
    }


    @Override
    public String toString() {

        return _parameterName;
    }
}
