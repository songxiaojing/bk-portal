package com.mpe.portal.web.controllers.application;


import com.mpe.portal.web.controllers.BaseController;
import com.mpe.portal.web.utils.module.ResourceModuleUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;


@Scope("prototype")
@Controller("TableController")
public class TableController extends BaseController {
    final private static Logger thelogger = LoggerFactory.getLogger(TableController.class);
    //

    /**
     * 构建树结构根据指定的树名称.
     *
     * @return
     * @throws Exception
     */
    public void tableHeader() throws Exception {
        //'{'"data":"{0}","title":"{1}","render":"columnContextRender","orderable":{2},"orderSequence":["asc","desc"]'}'
        //'{'"data":"{0}","title":"{1}","render":"{2}","orderable":{3},"orderSequence":["asc","desc"]'}'
        //Get request response session;
        HttpServletRequest request = this.getRequest();
        String tableHeaderName = request.getParameter("tableHeaderName");
        JSONObject dataTableHeaderJSON = new JSONObject();
        try {
            dataTableHeaderJSON.put("content", ResourceModuleUtils.getInstance().getHeaderContext(tableHeaderName, true, true));
            this.pushBackToClient(dataTableHeaderJSON.toString());
        } catch (Exception e) {
            thelogger.error("resMessageTableHeader", e);
            this.pushBackToClient("[]");
        }
    }

}
