package com.mpe.portal.web.resources.daos;

import com.mpe.portal.web.resources.modules.ResMessage;

public interface ResMessageMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ResMessage record);

    int insertSelective(ResMessage record);

    ResMessage selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ResMessage record);

    int updateByPrimaryKeyWithBLOBs(ResMessage record);

    int updateByPrimaryKey(ResMessage record);
}