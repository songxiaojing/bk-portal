package com.mpe.portal.web.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * 系统页面路径
 * Created by byw-m on 2016/8/9.
 */
public class AppPathHelp {
    //
    public HttpServletRequest _request = null;

    public AppPathHelp(HttpServletRequest request) {
        this._request = request;
    }

    public HttpServletRequest getRequest() {
        return _request;
    }

    public String getPath() {
        return _request.getContextPath();
    }

    public String getBasePath() {
        return _request.getScheme() + "://" + _request.getServerName() + ":" + _request.getServerPort() + getPath() + "/";
    }

    public String getThemeCssPath() {
        return getBasePath() + "theme/default/";
    }

    public String getCssPath() {
        return getThemeCssPath() + "css/";
    }

    public String getImagesPath() {
        return getThemeCssPath() + "images/";
    }

    public String getJsPath() {
        return getBasePath() + "js/";
    }


}
