package com.mpe.portal.web.controllers.news;


import com.mpe.portal.web.controllers.BaseController;
import com.mpe.portal.web.resources.modules.ResNews;
import com.mpe.portal.web.services.INewsService;
import com.mpe.portal.web.utils.Assert;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


@Scope("prototype")
@Controller("NewsView")
public class NewsView extends BaseController {
    //
    private INewsService newsService = null;

    @Resource(name = "NewsServiceImpl")
    public void setService(INewsService service) {
        this.newsService = service;
    }

    public String list() {
        return "list";
    }

    public String detail() {
        HttpServletRequest request = this.getRequest();
        String id = request.getParameter("id");
        if (Assert.isEmptyString(id)) {
            this.setForwardMessage("查看新闻id无效。");
            return "error";
        }
        ResNews resNews = newsService.getResNewsById(Long.parseLong(id));
        if (resNews == null) {
            this.setForwardMessage("新闻记录不存在{" + id + "}。");
            return "error";
        }
        request.setAttribute("resNews", resNews);
        return "detail";

    }

    public String publishResNews() {
        return "";
    }
}
