package com.mpe.portal.web.services;

import com.mpe.portal.web.resources.modules.MetricLoginRecord;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;


public interface IApplicationService {

    public boolean verifyLogin(String mobile,String password) throws Exception;


    public MetricLoginRecord recordUserLogin(HttpServletRequest request, String mobile);

    public void recordUserLogout(MetricLoginRecord sysUserLoginRecord);
}
