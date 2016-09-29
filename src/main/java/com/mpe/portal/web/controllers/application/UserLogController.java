package com.mpe.portal.web.controllers.application;


import com.mpe.portal.web.controllers.BaseController;
import com.mpe.portal.web.resources.modules.MetricLoginRecord;
import com.mpe.portal.web.services.IApplicationService;
import com.mpe.portal.web.utils.Assert;
import com.mpe.portal.web.utils.app.AppReferent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;


@Scope("prototype")
@Controller("UserLogController")
public class UserLogController extends BaseController {
    final private static Logger thelogger = LoggerFactory.getLogger(UserLogController.class);
    //
    private IApplicationService _applicationService = null;

    @Resource(name = "ApplicationServiceImpl")
    public void setService(IApplicationService applicationService) {
        this._applicationService = applicationService;
    }

    /**
     * dashboard 视图
     *
     * @return String
     */
    public String login() {
        try {
            HttpServletRequest request = this.getRequest();
            String mobile = request.getParameter("mobile");
            String password = request.getParameter("password");
            //
            thelogger.info("User[" + mobile + "] try to login with password.");
            if (Assert.isEmptyString(mobile) || Assert.isEmptyString(password)) {
                this.setForwardMessage("手机号或密码错误");
                return "loginView";
            }
            //检查登录的用户名与密码是否正确
            boolean isVerifyLogin = this._applicationService.verifyLogin(mobile, password);
            if (!isVerifyLogin) {
                this.setForwardMessage("手机号或密码错误");
                return "loginView";
            }

            //设置当前用户，客户资料到SESSION中
            this.setCurrentSysUser(mobile);

            //记录用户登录
            MetricLoginRecord sysUserLoginRecord = this._applicationService.recordUserLogin(request, mobile);

            this.getHttpSession().setAttribute(AppReferent.session_current_loginRecord.getValue(), sysUserLoginRecord);
            //取得对应用户的客户资料

            //如果没有客户资料，需要用户进行填写

            thelogger.info("System administrator[" + mobile + "] is Login.");
            //进入个人中心
            return "centerView";
        } catch (Exception e) {
            thelogger.error("login", e);
            return "loginView";
        }
    }

    /**
     * dashboard 视图
     *
     * @return String
     */
    public String logout() {
        //登出时清理SESSION中的缓存
        //清理用户
        this.setCurrentSysUser(null);

        //记录并清理用户登出时间
        HttpSession session = this.getHttpSession();
        MetricLoginRecord sysUserLoginRecord = (MetricLoginRecord) session.getAttribute(AppReferent.session_current_loginRecord.getValue());
        session.removeAttribute(AppReferent.session_current_loginRecord.getValue());
        if (sysUserLoginRecord != null) {
            sysUserLoginRecord.setLogoutType("正常退出");
            sysUserLoginRecord.setLogoutAt(new Date());
            _applicationService.recordUserLogout(sysUserLoginRecord);
        }
        return "loginView";
    }
}
