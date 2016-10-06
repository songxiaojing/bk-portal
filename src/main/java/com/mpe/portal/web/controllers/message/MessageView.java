package com.mpe.portal.web.controllers.message;


import com.mpe.portal.web.controllers.BaseController;
import com.mpe.portal.web.resources.modules.ResMessage;
import com.mpe.portal.web.services.IMessageService;
import com.mpe.portal.web.utils.Assert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

    @Resource(name = "MessageServiceImpl")
    public void setService(IMessageService service) {
        this.messageService = service;
    }

    public String list() {
        return "list";
    }

    public String detail() {
        HttpServletRequest request = this.getRequest();
        String id = request.getParameter("id");
        if (Assert.isEmptyString(id)) {
            this.setForwardMessage("查看留言id无效。");
            return "error";
        }
        ResMessage resMessage = messageService.getResMessageById(Long.parseLong(id));
        if (resMessage == null) {
            this.setForwardMessage("留言记录不存在{" + id + "}。");
            return "error";
        }
        request.setAttribute("resMessage", resMessage);
        return "detail";

    }
}
