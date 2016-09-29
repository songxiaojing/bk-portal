package com.mpe.portal.web.services.impl;

import com.mpe.portal.web.resources.daos.ResNewsMapper;
import com.mpe.portal.web.resources.modules.ResNews;
import com.mpe.portal.web.services.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by baiyanwei on 9/25/16.
 */
@Service("NewsServiceImpl")
public class NewsServiceImpl implements INewsService {

    private ResNewsMapper resNewsMapper = null;

    @Autowired
    public void setSysUserMapper(ResNewsMapper resNewsMapper) {

        this.resNewsMapper = resNewsMapper;

    }

    @Override
    public int publishNews(ResNews resNews) {
        if (resNews == null) {
            return 0;
        }
        return this.resNewsMapper.insertSelective(resNews);
    }

    @Override
    public int removeResNews(long resNewsId) {
        return this.resNewsMapper.deleteByPrimaryKey(resNewsId);
    }
}
