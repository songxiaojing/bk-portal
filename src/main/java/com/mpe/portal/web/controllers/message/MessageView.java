package com.mpe.portal.web.controllers.message;


import com.mpe.portal.web.controllers.BaseController;
import com.mpe.portal.web.services.IMessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * 股票公司管理
 * Created by martin on 5/10/16.
 */
@Scope("prototype")
@Controller("MessageView")
public class MessageView extends BaseController {
    final private static Logger theLogger = LoggerFactory.getLogger(MessageController.class);
    //
    private IMessageService messageService = null;

    @Resource(name = "IMessageServiceImpl")
    public void setService(IMessageService service) {
        this.messageService = service;
    }
}
