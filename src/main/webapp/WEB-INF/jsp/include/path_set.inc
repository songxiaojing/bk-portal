<%
    //页面全局使用到的变量
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    //系统使用到的样式 换肤路径
    String themeCssPath = basePath + "theme/tss/";
    String tssCssPath = basePath + "theme/tss/css/";
    String tssImagesPath = basePath + "theme/tss/images/";
    String jsPath = basePath + "js/";
    //
%>