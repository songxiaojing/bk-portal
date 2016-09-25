package com.mpe.portal.web.services.impl;

import com.mpe.portal.web.resources.daos.ResMessageMapper;
import com.mpe.portal.web.services.IMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by baiyanwei on 9/25/16.
 */
@Service("IMessageServiceImpl")
public class IMessageServiceImpl implements IMessageService {

    private ResMessageMapper resMessageMapper = null;

    @Autowired
    public void setSysUserMapper(ResMessageMapper resMessageMapper) {

        this.resMessageMapper = resMessageMapper;

    }


}
