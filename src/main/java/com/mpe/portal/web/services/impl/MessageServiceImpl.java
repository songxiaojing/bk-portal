package com.mpe.portal.web.services.impl;

import com.mpe.portal.web.resources.daos.ResMessageMapper;
import com.mpe.portal.web.resources.modules.ResMessage;
import com.mpe.portal.web.services.IMessageService;
import com.mpe.portal.web.utils.Assert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("MessageServiceImpl")
public class MessageServiceImpl implements IMessageService {

    final private static String INPUT_DATE_FORMATTOR = "yyyy-MM-dd";
    final private static String TABLE_DATE_FORMATTOR = "yyyy-MM-dd hh:mm:ss";
    final private static Logger theLogger = LoggerFactory.getLogger(MessageServiceImpl.class);

    private ResMessageMapper resMessageMapper = null;

    @Autowired
    public void setSysUserMapper(ResMessageMapper resMessageMapper) {

        this.resMessageMapper = resMessageMapper;

    }


    @Override
    public int createNewMessage(ResMessage resMessage) {
        if (resMessage == null) {
            return 0;
        }
        return this.resMessageMapper.insertSelective(resMessage);
    }

    @Override
    public int feedbackMessage(ResMessage resMessage) {
        if (resMessage == null) {
            return 0;
        }
        return this.resMessageMapper.updateByPrimaryKeySelective(resMessage);
    }

    @Override
    public int countByCondition(HashMap<String, String> paramsMap) {

        try {
            return this.resMessageMapper.countByCondition(buildSelectConditionMap(paramsMap));
        } catch (ParseException e) {
            theLogger.error("countByCondition", e);
        }
        return 0;
    }

    @Override
    public List<HashMap<String, String>> selectByCondition(HashMap<String, String> paramsMap) {
        try {
            List<ResMessage> selectList = this.resMessageMapper.selectByCondition(buildSelectConditionMap(paramsMap));
            ArrayList<HashMap<String, String>> tabDataList = new ArrayList<HashMap<String, String>>();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(TABLE_DATE_FORMATTOR);
            for (ResMessage resMessage : selectList) {
                try {
                    HashMap<String, String> rawData = new HashMap<String, String>();
                    rawData.put("id", String.valueOf(resMessage.getId()));
                    rawData.put("name", resMessage.getName());
                    rawData.put("mobile", resMessage.getMobile());
                    rawData.put("email", resMessage.getEmail());
                    rawData.put("messageAt", simpleDateFormat.format(resMessage.getMessageAt()));
                    if (Assert.isEmptyString(resMessage.getFeedback())) {
                        rawData.put("feedback", "");
                    } else {
                        rawData.put("feedback", resMessage.getFeedback());
                    }
                    if (resMessage.getFeedbackAt() == null) {
                        rawData.put("feedbackAt", "");
                    } else {
                        rawData.put("feedbackAt", simpleDateFormat.format(resMessage.getFeedbackAt()));
                    }
                    if (Assert.isEmptyString(resMessage.getFeedbackBy())) {
                        rawData.put("feedbackBy", "");
                    } else {
                        rawData.put("feedbackBy", resMessage.getFeedbackBy());
                    }
                    rawData.put("createAt", simpleDateFormat.format(resMessage.getCreateAt()));
                    rawData.put("message", resMessage.getMessage());
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

    @Override
    public ResMessage getResMessageById(long id) {
        return this.resMessageMapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteMessageByIds(String ids) {
        if (Assert.isEmptyString(ids)) {
            return 0;
        }
        return this.resMessageMapper.deleteByIds(ids);
    }

    private Map<String, Object> buildSelectConditionMap(HashMap<String, String> conditionMap) throws ParseException {
        try {
            //


            // theLogger.debug("get Bean:" + beanContext.getBean(targetMapperClass).hashCode());
            //计算分页长度
            int pageNumber = Integer.parseInt(conditionMap.get("start"));
            int pageSize = Integer.parseInt(conditionMap.get("length"));
            pageNumber = pageNumber - 1;
            if (pageNumber < 0) {
                pageNumber = 0;
            }
            pageNumber = pageNumber * pageSize;
            theLogger.debug("#query conditon condionMap:" + conditionMap.toString());
            // 将Map<String,String>转变 Map<String,Object> 并设置pageNo和pageSize
            Map<String, Object> changeMap = new HashMap<String, Object>();
            for (String name : conditionMap.keySet()) {
                String value = conditionMap.get(name);
                Object newValues = null;
                if (name.contains("_startAt") || name.contains("_endAt")) {
                    if (Assert.isEmptyString(value) == false) {
                        SimpleDateFormat yyyyMMdd = new SimpleDateFormat(INPUT_DATE_FORMATTOR);
                        newValues = yyyyMMdd.parse(value);
                    }
                } else {
                    newValues = value;
                }
                changeMap.put(name, newValues);
            }
            changeMap.put("pageNo", pageNumber);
            changeMap.put("pageSize", pageSize);

            theLogger.debug("#query conditon changeMap:" + changeMap.toString());

            return changeMap;

        } catch (Exception e) {
            throw e;
        }
    }

}
