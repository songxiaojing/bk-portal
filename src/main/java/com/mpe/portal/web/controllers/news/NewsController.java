package com.mpe.portal.web.controllers.news;


import com.mpe.portal.web.controllers.BaseController;
import com.mpe.portal.web.resources.modules.ResNews;
import com.mpe.portal.web.services.INewsService;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Scope("prototype")
@Controller("NewsController")
public class NewsController extends BaseController {
    //
    final private static Logger theLogger = LoggerFactory.getLogger(NewsController.class);
    //
    private INewsService newsService = null;

    @Resource(name = "NewsServiceImpl")
    public void setService(INewsService service) {
        this.newsService = service;
    }

    public String publishNews() throws Exception {
        //
        HttpServletRequest request = this.getRequest();
        try {

            String newTitle = request.getParameter("newTitle");
            if (Assert.isEmptyString("newTitle")) {
                this.setForwardMessage("标题不能为空");
                return "message";
            }

            String newCatagory = request.getParameter("newCatagory");
            if (Assert.isEmptyString("newCatagory")) {
                this.setForwardMessage("分类不能为空");
                return "message";
            }

            String newBody = request.getParameter("newBody");
            if (Assert.isEmptyString("newBody")) {
                this.setForwardMessage("新闻内容不能为空");
                return "message";
            }

            Date currentDate = new Date();
            ResNews resNews = new ResNews();
            resNews.setCreateAt(currentDate);
            resNews.setPublishAt(currentDate);
            resNews.setPublishBy(this.getCurrentSysUser());
            //
            resNews.setNewSource(request.getParameter("newSource"));
            resNews.setNewBody(newBody);
            resNews.setNewTitle(newTitle);
            resNews.setNewCatagory(newCatagory);
            //

            //
            int result = newsService.publishNews(resNews);
            if (result > 0) {
                this.setForwardMessage("发布新闻成功");
            }
            theLogger.info("Pushlish a news :" + newTitle);
            return "message";
        } catch (Exception e) {
            throw e;
        }
    }

    public void removeNews() throws Exception {
        String ids = getRequest().getParameter("ids");
        if (Assert.isEmptyString(ids)) {
            throw new Exception("删除新闻记录id无效");
        }
        int result = this.newsService.deleteByIds(ids);
        JSONObject resultObj = new JSONObject();
        resultObj.put("message", "成功删除消息 " + result + " 条");
        this.pushBackToClient(HttpStatus.OK, HttpContentType.JSON, resultObj.toString());
        
    }

    public void listTableData() throws Exception {
        HashMap<String, String> paramsMap = this.getParameterMap();
        //
        String draw = paramsMap.get("draw");
        long resourceCount = newsService.countByCondition(paramsMap);
        List<HashMap<String, String>> viewDataList = null;
        if (resourceCount == 0) {
            viewDataList = new ArrayList<HashMap<String, String>>();
        } else {
            viewDataList = newsService.selectByCondition(paramsMap);
        }
        //
        String rowsMessage = this.buildDataTablesRowData(viewDataList, resourceCount, draw);
        //_PageUtil.WriteReponseText(response, result);
        //将查询结果推送回去
        this.pushBackToClient(rowsMessage);

    }
}
