<%--
  Created by IntelliJ IDEA.
  User: baiyanwei
  Date: 10/6/16
  Time: 2:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mpe.portal.web.resources.modules.ResNews" %>
<%@ page import="com.mpe.portal.web.utils.WebText" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.mpe.portal.web.utils.Assert" %>
<%
    ResNews resNews = (ResNews) request.getAttribute("resNews");
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>
<html>
<head>
    <title><%=WebText.WEB_TITLE%>
    </title>
    <link href="/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        p {
            font-size: 15px;
            line-height: 1.718em;
            font-family: "HanHei SC", "PingHei", "PingFang SC", "STHeitiSC-Light", "Helvetica Neue", "Helvetica", "Arial", sans-serif;
        }
        .container img {
            max-width: 400px;
            max-height: inherit;
        }

        .page-header small {
            font-size: 14px;
        }
    </style>
</head>
<body>

<!-- Begin page content -->
<div class="container">
    <div class="page-header">
        <h2>${resNews.newTitle}
        </h2>
    </div>
    <small class="pull-right">发布人：${resNews.publishBy} 时间：<%=simpleDateFormat.format(resNews.getPublishAt())%>
    </small>

    <%
        if (Assert.isEmptyString(resNews.getType()) == false) {
            out.println("<p><img src='/news/newsView.showImage.action?id=" + resNews.getId() + "'></p>");
        }
    %>
    <p>正文：</p>
    <p>${resNews.newBody}</p>
    <hr>
    <p class="text-muted">来源：${resNews.newSource}</p>
</div>
</body>
</html>