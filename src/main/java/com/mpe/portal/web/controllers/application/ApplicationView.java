package com.mpe.portal.web.controllers.application;


import com.mpe.portal.web.controllers.BaseController;
import com.mpe.portal.web.services.DataBaseService;
import com.mpe.portal.web.utils.HttpContentType;
import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.List;


@Scope("prototype")
@Controller("ApplicationView")
public class ApplicationView extends BaseController {
    final private static Logger thelogger = LoggerFactory.getLogger(ApplicationView.class);


    public String helpView() {
        HttpServletRequest request = this.getRequest();

        // String tomcatPath = this.getHttpSession().getServletContext().getRealPath("/");
        String jdkVesrion = System.getProperty("java.version", "not specified");
        String jdkPath = System.getProperty("java.home", "not specified");
        DecimalFormat df = new DecimalFormat("0.00");
        // 虚拟机中的内存总量
        String totalMem = df.format(Runtime.getRuntime().totalMemory() / (1024 * 1024)) + " MB";
        // Java 虚拟机试图使用的最大内存量
        String maxMen = df.format(Runtime.getRuntime().maxMemory() / (1024 * 1024)) + " MB";
        // Java 虚拟机中的空闲内存量。
        String freeMen = df.format(Runtime.getRuntime().freeMemory() / (1024 * 1024)) + " MB";
        String tomcatPath = System.getProperty("user.dir");

        request.setAttribute("jdkVesrion", jdkVesrion);
        request.setAttribute("jdkPath", jdkPath);
        request.setAttribute("totalMem", totalMem);
        request.setAttribute("maxMen", maxMen);
        request.setAttribute("freeMen", freeMen);
        request.setAttribute("tomcatPath", tomcatPath);
        request.setAttribute("applicationVersion", "V 0.0.1");

        return "help";
    }

}
