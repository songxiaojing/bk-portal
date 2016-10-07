package com.mpe.portal.web.controllers.application;


import com.mpe.portal.web.controllers.BaseController;
import com.mpe.portal.web.services.DataBaseService;
import com.mpe.portal.web.services.IApplicationService;
import com.mpe.portal.web.utils.HttpContentType;
import com.mpe.portal.web.utils.module.ResourceModuleUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Scope("prototype")
@Controller("VisitController")
public class VisitController extends BaseController {
    final private static Logger thelogger = LoggerFactory.getLogger(VisitController.class);
    //
    final private String SQL_VISIT_DALIY = "SELECT DATE_FORMAT(VISIT_AT,'%Y%m%d') M_DAY,COUNT(VISIT_AT) AS M_TIMES FROM METRIC_WEB_VISIT_RECORD WHERE VISIT_AT<= now() AND VISIT_AT >=date_sub(now(),interval 1 month) GROUP BY M_DAY ORDER BY M_DAY";
    private DataBaseService dataBaseService = null;

    @Resource(name = "DataBaseService")
    public void setService(DataBaseService dataBaseService) {
        this.dataBaseService = dataBaseService;
    }

    /**
     * 构建树结构根据指定的树名称.
     *
     * @return
     * @throws Exception
     */
    public void visitDaliyChartData() throws Exception {
        List<Object[]> dataList = this.dataBaseService.selectRecords(this.dataBaseService.getDataSource(), SQL_VISIT_DALIY);
        JSONArray resultArray = new JSONArray();
         /*
        [['Shanghai', 23.7],['Lagos', 16.1]]
        */
        for (Object[] rawObjs : dataList) {
            JSONArray rowArray = new JSONArray();
            rowArray.put(rawObjs[0]).put(rawObjs[1]);
            resultArray.put(rawObjs);
        }

        try {
            this.pushBackToClient(HttpStatus.OK, HttpContentType.JSON, resultArray.toString());
        } catch (Exception e) {
            thelogger.error("resMessageTableHeader", e);
            this.pushBackToClient("[]");
        }
    }

}
