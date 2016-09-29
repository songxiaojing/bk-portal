package com.mpe.portal.web.controllers.news;


import com.mpe.portal.web.controllers.BaseController;
import com.mpe.portal.web.resources.modules.ResMessage;
import com.mpe.portal.web.resources.modules.ResNews;
import com.mpe.portal.web.services.INewsService;
import com.mpe.portal.web.utils.Assert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

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

    public String publishNews() throws Exception{
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

    public String removeNews() throws Exception{
        HttpServletRequest request = this.getRequest();
        try {

            String resNewsId = request.getParameter("resNewsId");
            if (Assert.isEmptyString("resNewsId")) {
                this.setForwardMessage("新闻id无效");
                return "message";
            }

            //
            int result = newsService.removeResNews(Long.parseLong(resNewsId));
            if (result > 0) {
                this.setForwardMessage("删除新闻成功");
            }
            theLogger.info("Remove news id:" + resNewsId);
            return "message";
        } catch (Exception e) {
            throw e;
        }
    }
}
