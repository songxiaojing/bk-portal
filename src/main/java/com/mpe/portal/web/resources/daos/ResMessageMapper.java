package com.mpe.portal.web.resources.daos;

import com.mpe.portal.web.resources.modules.ResMessage;

import java.util.List;
import java.util.Map;

public interface ResMessageMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ResMessage record);

    int insertSelective(ResMessage record);

    ResMessage selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ResMessage record);

    int updateByPrimaryKeyWithBLOBs(ResMessage record);

    int updateByPrimaryKey(ResMessage record);

    /**
     * 按条件MAP进行查询.
     *
     * @param conditionMap
     * @return
     */
    public List<ResMessage> selectByCondition(Map<String, Object> conditionMap);

    /**
     * 按条件进行查询统计.
     *
     * @param conditionMap
     * @return
     */
    public int countByCondition(Map<String, Object> conditionMap);

    public int deleteByIds(String ids);
}