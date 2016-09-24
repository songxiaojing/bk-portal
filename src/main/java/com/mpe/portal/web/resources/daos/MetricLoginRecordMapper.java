package com.mpe.portal.web.resources.daos;

import com.mpe.portal.web.resources.modules.MetricLoginRecord;

public interface MetricLoginRecordMapper {
    int deleteByPrimaryKey(Long id);

    int insert(MetricLoginRecord record);

    int insertSelective(MetricLoginRecord record);

    MetricLoginRecord selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(MetricLoginRecord record);

    int updateByPrimaryKeyWithBLOBs(MetricLoginRecord record);

    int updateByPrimaryKey(MetricLoginRecord record);
}