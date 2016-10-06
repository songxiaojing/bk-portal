package com.mpe.portal.web.services.impl;


import com.mpe.portal.web.resources.daos.MetricLoginRecordMapper;
import com.mpe.portal.web.resources.daos.MetricWebVisitRecordMapper;
import com.mpe.portal.web.resources.modules.MetricLoginRecord;
import com.mpe.portal.web.resources.modules.MetricWebVisitRecord;
import com.mpe.portal.web.services.BaseService;
import com.mpe.portal.web.services.IApplicationService;
import com.mpe.portal.web.utils.Assert;
import com.mpe.portal.web.utils.IOUtils;
import com.mpe.portal.web.utils.http.HttpRequestUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;


@Service("ApplicationServiceImpl")
public class ApplicationServiceImpl extends BaseService implements IApplicationService {
    //
    final private static Logger theLogger = LoggerFactory.getLogger(ApplicationServiceImpl.class);
    //
    final private static String USER_FILE_PATH = "users.properties";
    //
    private MetricLoginRecordMapper metricLoginRecordMapper = null;

    private MetricWebVisitRecordMapper metricWebVisitRecordMapper = null;

    @Autowired
    public void setSysUserMapper(MetricLoginRecordMapper mlrMapper, MetricWebVisitRecordMapper mwvrMapper) {

        this.metricLoginRecordMapper = mlrMapper;
        this.metricWebVisitRecordMapper = mwvrMapper;

    }

    @Override
    public boolean verifyLogin(String mobile, String password) throws Exception {
        if (Assert.isEmptyString(mobile) || Assert.isEmptyString(password)) {
            return false;
        }
        try {
            Properties userProperties = IOUtils.createProperties(USER_FILE_PATH);
            if (userProperties == null || !userProperties.containsKey(mobile)) {
                return false;
            }
            String recordPassword = userProperties.getProperty(mobile, "");
            if (password.equals(recordPassword)) {
                return true;
            }
        } catch (IOException e) {
            theLogger.error("verifyLogin", e);
        }
        return false;
    }

    @Override
    public MetricLoginRecord recordUserLogin(HttpServletRequest request, String mobile) {
        if (request == null || Assert.isEmptyString(mobile)) {
            return null;
        }
        //create login record instance
        MetricLoginRecord metricLoginRecord = new MetricLoginRecord();
        Date currentDate = new Date();
        metricLoginRecord.setCreateAt(currentDate);
        metricLoginRecord.setLoginAt(currentDate);
        metricLoginRecord.setSessionId(request.getSession().getId());
        try {
            metricLoginRecord.setRemoteIp(HttpRequestUtil.getRemoteAddr(request));
        } catch (Exception e) {
            metricLoginRecord.setRemoteIp(request.getRemoteAddr());
        }
        metricLoginRecord.setHttpHead(HttpRequestUtil.getHttpHeader(request).toString());
        metricLoginRecord.setUserAgent(HttpRequestUtil.getUserAgent(request));
        metricLoginRecord.setUserName(mobile);
        //
        this.metricLoginRecordMapper.insertSelective(metricLoginRecord);
        theLogger.info("Record user[" + mobile + "] login.");
        return metricLoginRecord;
    }

    @Override
    public void recordUserLogout(MetricLoginRecord sysUserLoginRecord) {
        if (sysUserLoginRecord == null) {
            return;
        }
        this.metricLoginRecordMapper.updateByPrimaryKeySelective(sysUserLoginRecord);
    }

    @Override
    public void recordVisitItem(HttpServletRequest request) {
        if (request == null) {
            return;
        }

        Date currentDate = new Date();
        MetricWebVisitRecord metricWebVisitRecord = new MetricWebVisitRecord();
        metricWebVisitRecord.setCreateAt(currentDate);
        try {
            metricWebVisitRecord.setRemoteIp(HttpRequestUtil.getRemoteAddr(request));
        } catch (Exception e) {
            metricWebVisitRecord.setRemoteIp(request.getRemoteAddr());
        }
        metricWebVisitRecord.setHttpHead(HttpRequestUtil.getHttpHeader(request).toString());
        metricWebVisitRecord.setVisitReferent(request.getHeader("Referer"));
        metricWebVisitRecord.setVisitAt(currentDate);
        metricWebVisitRecord.setVisitTarget(request.getServletPath());
        metricWebVisitRecord.setUserAgent(HttpRequestUtil.getUserAgent(request));
        this.metricWebVisitRecordMapper.insertSelective(metricWebVisitRecord);
    }

}
