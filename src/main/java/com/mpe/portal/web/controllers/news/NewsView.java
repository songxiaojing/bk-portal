package com.mpe.portal.web.controllers.news;


import com.mpe.portal.web.controllers.BaseController;
import com.mpe.portal.web.resources.modules.ResNews;
import com.mpe.portal.web.services.INewsService;
import com.mpe.portal.web.utils.Assert;
import com.mpe.portal.web.utils.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


@Scope("prototype")
@Controller("NewsView")
public class NewsView extends BaseController {
    final private static Logger theLogger = LoggerFactory.getLogger(NewsView.class);
    //
    private INewsService newsService = null;

    @Resource(name = "NewsServiceImpl")
    public void setService(INewsService service) {
        this.newsService = service;
    }

    /**
     * 新闻列表页面
     *
     * @return
     */
    public String news() {

        int pageSize = 20;
        int pageNumber = 1;
        HttpServletRequest request = this.getRequest();
        //
        if (!Assert.isEmptyString(request.getParameter("pageNumber"))) {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        }

        int newsCounter = this.newsService.countNews();
        int paginationRange = (newsCounter + pageSize - 1) / pageSize;
        if (pageNumber > paginationRange) {
            pageNumber = 1;
        }
        List<ResNews> pageNewsList = null;
        if (newsCounter > 0) {
            pageNewsList = this.newsService.selectNewsByPageNumber(pageNumber, pageSize);
        } else {
            pageNewsList = new ArrayList<ResNews>();
        }
        //
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("paginationRange", paginationRange);
        request.setAttribute("newsCounter", newsCounter);
        request.setAttribute("pageNewsList", pageNewsList);

        return "news";
    }

    public void newsTop10() throws Exception {
        JSONArray newTop10Array = new JSONArray();

        int pageSize = 10;
        int pageNumber = 1;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        List<ResNews> pageNewsList = this.newsService.selectNewsByPageNumber(pageNumber, pageSize);
        if (pageNewsList != null && pageNewsList.isEmpty() == false) {
            for (ResNews news : pageNewsList) {
                JSONObject newsObject = new JSONObject();
                newsObject.put("id", news.getId());
                newsObject.put("date", simpleDateFormat.format(news.getCreateAt()));
                newsObject.put("title", news.getNewTitle());
                newTop10Array.put(newsObject);
            }

        }
        this.pushBackToClient(newTop10Array.toString());
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

    /**
     * 发布新闻
     *
     * @return
     */
    public String publishResNews() {

        return "publishResNews";
    }

    public void showImage() {
        HttpServletRequest request = this.getRequest();
        String id = request.getParameter("id");
        if (Assert.isEmptyString(id)) {
            this.setForwardMessage("查看新闻id无效。");
            //return "error";
        }

        //theLogger.debug("downloadFile", downResourceFileName, downResourceFile.getAbsoluteFile());
        //
        HttpServletResponse response = this.getResponse();
        ServletOutputStream sOutput = null;
        try {
            ResNews resNews = newsService.getResNewsById(Long.parseLong(id));

            if (resNews == null) {
                return;
            }
            String imageName = resNews.getType();
            if (Assert.isEmptyString(imageName)) {
                return;
            }
            byte[] imageByte = resNews.getNewPicture();
            if (imageByte == null || imageByte.length == 0) {
                return;
            }

            imageByte = IOUtils.decompress(imageByte);

            //设置下载文档的类型
            response.setContentType("image/jpeg");
            //设置输出文件的长度
            response.setContentLength(imageByte.length);
            //设置响应头信息，让下载的文件显示保存信息
            //

            //
            sOutput = response.getOutputStream();

            sOutput.write(imageByte);

            sOutput.flush();
        } catch (FileNotFoundException e) {
            theLogger.error("", e);
        } catch (IOException e) {
            theLogger.error("", e);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //关闭下载文件
            //关闭Response输出流
            if (sOutput != null) {
                try {
                    sOutput.close();
                } catch (Exception e) {
                }
            }
        }

    }

}
