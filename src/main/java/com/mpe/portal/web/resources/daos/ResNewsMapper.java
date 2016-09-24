package com.mpe.portal.web.resources.daos;

import com.mpe.portal.web.resources.modules.ResNews;

public interface ResNewsMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ResNews record);

    int insertSelective(ResNews record);

    ResNews selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ResNews record);

    int updateByPrimaryKeyWithBLOBs(ResNews record);

    int updateByPrimaryKey(ResNews record);
}