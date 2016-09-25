package com.mpe.portal.web.controllers.news;


import com.mpe.portal.web.controllers.BaseController;
import com.mpe.portal.web.services.INewsService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;


@Scope("prototype")
@Controller("NewsView")
public class NewsView extends BaseController {
    //
    private INewsService newsService = null;

    @Resource(name = "NewsServiceImpl")
    public void setService(INewsService service) {
        this.newsService = service;
    }

    /**
     * dashboard 视图
     *
     * @return String
     */
    public String dashboardView() {
        return "dashboardView";
    }
}
