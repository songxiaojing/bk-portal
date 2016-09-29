package com.mpe.portal.web.services.impl;

import com.mpe.portal.web.resources.daos.ResMessageMapper;
import com.mpe.portal.web.resources.modules.ResMessage;
import com.mpe.portal.web.services.IMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("IMessageServiceImpl")
public class IMessageServiceImpl implements IMessageService {

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
}
