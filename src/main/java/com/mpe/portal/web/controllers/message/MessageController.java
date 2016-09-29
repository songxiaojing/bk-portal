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
import java.util.Date;


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

    /**
     * 保存留言
     *
     * @return
     */
    public String recordMessage() {
        //
        HttpServletRequest request = this.getRequest();
        try {

            String name = request.getParameter("name");
            if (Assert.isEmptyString("name")) {
                this.setForwardMessage("姓名不能为空");
                return "message";
            }

            String mobile = request.getParameter("mobile");
            if (Assert.isEmptyString("手机不能为空")) {
                return "message";
            }

            String email = request.getParameter("email");
            if (Assert.isEmptyString("邮箱不能为空")) {
                return "message";
            }

            String message = request.getParameter("message");
            if (Assert.isEmptyString("消息不能为空")) {
                return "message";
            }
            Date currentDate = new Date();

            ResMessage resMessage = new ResMessage();
            //
            resMessage.setCreateAt(currentDate);
            resMessage.setMessage(message);
            resMessage.setMessageAt(currentDate);
            resMessage.setName(name);
            resMessage.setEmail(email);
            resMessage.setMobile(mobile);
            //
            int result = messageService.createNewMessage(resMessage);
            if (result > 0) {
                this.setForwardMessage("保存成功");
            }
            theLogger.info("Customer's message has saved.");
            return "message";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";

    }

    /**
     * 保存留言
     *
     * @return
     */
    public String feedbackMessage() {
        //
        HttpServletRequest request = this.getRequest();
        try {

            String id = request.getParameter("id");
            if (Assert.isEmptyString("id")) {
                this.setForwardMessage("id不能为空");
                return "message";
            }

            String feedback = request.getParameter("feedback");
            if (Assert.isEmptyString("feedback")) {
                this.setForwardMessage("反馈不能为空");
                return "message";
            }

            ResMessage resMessage = new ResMessage();
            //
            resMessage.setId(Long.parseLong(id));
            resMessage.setFeedback(feedback);
            resMessage.setFeedbackAt(new Date());
            resMessage.setFeedbackBy(this.getCurrentSysUser());
            //
            int result = messageService.feedbackMessage(resMessage);
            if (result > 0) {
                this.setForwardMessage("反馈成功");
            }
            theLogger.info("Feedback is saved for id:" + id);
            return "message";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public String removeMessage(){
        return "";
    }
}
