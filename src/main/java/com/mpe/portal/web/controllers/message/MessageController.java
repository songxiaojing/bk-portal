package com.mpe.portal.web.controllers.message;


import com.mpe.portal.web.controllers.BaseController;
import com.mpe.portal.web.resources.modules.ResMessage;
import com.mpe.portal.web.services.IMessageService;
import com.mpe.portal.web.utils.Assert;
import com.mpe.portal.web.utils.HttpContentType;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;


@Scope("prototype")
@Controller("MessageController")
public class MessageController extends BaseController {
    final private static Logger theLogger = LoggerFactory.getLogger(MessageController.class);
    //
    private IMessageService messageService = null;

    @Resource(name = "MessageServiceImpl")
    public void setService(IMessageService service) {
        this.messageService = service;
    }

    public void listTableData() throws Exception {
        HashMap<String, String> paramsMap = this.getParameterMap();
        //
        String draw = paramsMap.get("draw");
        long resourceCount = messageService.countByCondition(paramsMap);
        List<HashMap<String, String>> viewDataList = null;
        if (resourceCount == 0) {
            viewDataList = new ArrayList<HashMap<String, String>>();
        } else {
            viewDataList = messageService.selectByCondition(paramsMap);
        }
        //
        String rowsMessage = this.buildDataTablesRowData(viewDataList, resourceCount, draw);
        //_PageUtil.WriteReponseText(response, result);
        //将查询结果推送回去
        this.pushBackToClient(rowsMessage);

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

    public void remove() throws Exception {
        String ids = getRequest().getParameter("ids");
        if (Assert.isEmptyString(ids)) {
            throw new Exception("删除消息记录id无效");
        }
        int result = this.messageService.deleteMessageByIds(ids);
        JSONObject resultObj = new JSONObject();
        resultObj.put("message", "成功删除消息 " + result + " 条");
        this.pushBackToClient(HttpStatus.OK, HttpContentType.JSON, resultObj.toString());
        return;
    }
}
