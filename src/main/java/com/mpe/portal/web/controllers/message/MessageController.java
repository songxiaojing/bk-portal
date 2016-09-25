package com.mpe.portal.web.controllers.message;


import com.mpe.portal.web.controllers.BaseController;
import com.mpe.portal.web.services.IMessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;


@Scope("prototype")
@Controller("MessageController")
public class MessageController extends BaseController {
    final private static Logger theLogger = LoggerFactory.getLogger(MessageController.class);
    //
    private IMessageService messageService = null;

    @Resource(name = "IMessageServiceImpl")
    public void setService(IMessageService service) {
        this.messageService = service;
    }


}
