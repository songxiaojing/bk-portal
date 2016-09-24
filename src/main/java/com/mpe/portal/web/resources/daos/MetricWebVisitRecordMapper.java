package com.mpe.portal.web.resources.daos;

import com.mpe.portal.web.resources.modules.MetricWebVisitRecord;

public interface MetricWebVisitRecordMapper {
    int deleteByPrimaryKey(Long id);

    int insert(MetricWebVisitRecord record);

    int insertSelective(MetricWebVisitRecord record);

    MetricWebVisitRecord selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(MetricWebVisitRecord record);

    int updateByPrimaryKeyWithBLOBs(MetricWebVisitRecord record);

    int updateByPrimaryKey(MetricWebVisitRecord record);
}