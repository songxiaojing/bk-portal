package com.mpe.portal.web.services.impl;

import com.mpe.portal.web.resources.daos.ResMessageMapper;
import com.mpe.portal.web.resources.modules.ResMessage;
import com.mpe.portal.web.services.IMessageService;
import com.mpe.portal.web.utils.Assert;
import com.mpe.portal.web.utils.datatable.DataTablePagationUtil;
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
            return this.resMessageMapper.countByCondition(DataTablePagationUtil.buildSelectConditionMap(paramsMap));
        } catch (ParseException e) {
            theLogger.error("countByCondition", e);
        }
        return 0;
    }

    @Override
    public List<HashMap<String, String>> selectByCondition(HashMap<String, String> paramsMap) {
        try {
            List<ResMessage> selectList = this.resMessageMapper.selectByCondition(DataTablePagationUtil.buildSelectConditionMap(paramsMap));
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
        return this.resMessageMapper.deleteByIds(ids.split(","));
    }


}
