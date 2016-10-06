package com.mpe.portal.web.resources.daos;

import com.mpe.portal.web.resources.modules.ResNews;

import java.util.List;
import java.util.Map;

public interface ResNewsMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ResNews record);

    int insertSelective(ResNews record);

    ResNews selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ResNews record);

    int updateByPrimaryKeyWithBLOBs(ResNews record);

    int updateByPrimaryKey(ResNews record);

    /**
     * 按条件MAP进行查询.
     *
     * @param conditionMap
     * @return
     */
    public List<ResNews> selectByCondition(Map<String, Object> conditionMap);

    /**
     * 按条件进行查询统计.
     *
     * @param conditionMap
     * @return
     */
    public int countByCondition(Map<String, Object> conditionMap);

}