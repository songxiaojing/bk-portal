package com.mpe.portal.web.services.impl;

import com.mpe.portal.web.resources.daos.ResNewsMapper;
import com.mpe.portal.web.resources.modules.ResMessage;
import com.mpe.portal.web.resources.modules.ResNews;
import com.mpe.portal.web.services.INewsService;
import com.mpe.portal.web.utils.Assert;
import com.mpe.portal.web.utils.datatable.DataTablePagationUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by baiyanwei on 9/25/16.
 */
@Service("NewsServiceImpl")
public class NewsServiceImpl implements INewsService {
    final private static String TABLE_DATE_FORMATTOR = "yyyy-MM-dd hh:mm:ss";
    final private static Logger theLogger = LoggerFactory.getLogger(NewsServiceImpl.class);
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
    public int deleteByIds(String ids) {
        if (Assert.isEmptyString(ids)) {
            return 0;
        }
        return this.resNewsMapper.deleteByIds(ids);
    }

    @Override
    public ResNews getResNewsById(long id) {
        return this.resNewsMapper.selectByPrimaryKey(id);
    }

    @Override
    public long countByCondition(HashMap<String, String> paramsMap) {
        try {
            return this.resNewsMapper.countByCondition(DataTablePagationUtil.buildSelectConditionMap(paramsMap));
        } catch (ParseException e) {
            theLogger.error("countByCondition", e);
        }
        return 0;
    }

    @Override
    public List<HashMap<String, String>> selectByCondition(HashMap<String, String> paramsMap) {
        try {
            List<ResNews> selectList = this.resNewsMapper.selectByCondition(DataTablePagationUtil.buildSelectConditionMap(paramsMap));
            ArrayList<HashMap<String, String>> tabDataList = new ArrayList<HashMap<String, String>>();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(TABLE_DATE_FORMATTOR);
            for (ResNews resNewses : selectList) {
                try {
                    HashMap<String, String> rawData = new HashMap<String, String>();
                    //
                    rawData.put("id", String.valueOf(resNewses.getId()));

                    rawData.put("type", resNewses.getType());
                    rawData.put("style", resNewses.getStyle());
                    rawData.put("newTitle", resNewses.getNewTitle());
                    rawData.put("newCatagory", resNewses.getNewCatagory());
                    rawData.put("newSource", resNewses.getNewSource());
                    rawData.put("publishAt", resNewses.getPublishAt() == null ? "" : simpleDateFormat.format(resNewses.getPublishAt()));
                    rawData.put("publishBy", resNewses.getPublishBy());
                    rawData.put("createAt", resNewses.getCreateAt() == null ? "" : simpleDateFormat.format(resNewses.getCreateAt()));
                    //rawData.put("newBody", resNewses.getNewBody());
                    tabDataList.add(rawData);
                } catch (Exception e) {
                    theLogger.error("", e);
                }

            }
            return tabDataList;
        } catch (ParseException e) {
            theLogger.error("", e);
        }
        return new ArrayList<HashMap<String, String>>();
    }
    
}
