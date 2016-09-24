package com.mpe.portal.web.services.impl;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mpe.portal.web.resources.daos.MetricLoginRecordMapper;
import com.mpe.portal.web.resources.daos.MetricWebVisitRecordMapper;
import com.mpe.portal.web.services.IApplicationService;
import com.mpe.portal.web.services.BaseService;

import java.util.HashMap;


@Service("ApplicationServiceImpl")
public class ApplicationServiceImpl extends BaseService implements IApplicationService {
    final private static Logger theLogger = LoggerFactory.getLogger(ApplicationServiceImpl.class);
    //
    private MetricLoginRecordMapper metricLoginRecordMapper = null;

    private MetricWebVisitRecordMapper metricWebVisitRecordMapper = null;

    @Autowired
    public void setSysUserMapper(MetricLoginRecordMapper metricLoginRecordMapper, MetricWebVisitRecordMapper metricWebVisitRecordMapper) {

        this.metricLoginRecordMapper = metricLoginRecordMapper;
        this.metricWebVisitRecordMapper = metricWebVisitRecordMapper;
    }

    @Override
    public boolean verifyLogin(HashMap<String, String> parameterMap) throws Exception {
        return false;
    }

}
