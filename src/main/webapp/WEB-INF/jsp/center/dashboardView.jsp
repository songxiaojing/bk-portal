<%--
  Created by IntelliJ IDEA.
  User: byw-m
  Date: 2016/6/2
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String currentUser = (String) request.getAttribute("currentUser");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="icon" type="image/png" href="/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

    <title>MPE-网站后台管理</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <meta name="viewport" content="width=device-width"/>


    <!-- Bootstrap core CSS     -->
    <link href="/plugins/lbd/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Animation library for notifications   -->
    <link href="/plugins/lbd/css/animate.min.css" rel="stylesheet"/>
    <!--  Light Bootstrap Table core CSS    -->
    <link href="/plugins/lbd/css/light-bootstrap-dashboard.css" rel="stylesheet"/>
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="/plugins/lbd/css/dashboard.css" rel="stylesheet"/>
    <!--     Fonts and icons     -->
    <link href="/plugins/lbd/css/pe-icon-7-stroke.css" rel="stylesheet"/>
</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-color="blue" data-image="/theme/defaut/images/sidebar-5.jpg">
        <!--

            Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
            Tip 2: you can also add an image using data-image tag

        -->

        <div class="sidebar-wrapper">
            <div class="logo text-center" style="height: 61px;line-height:60px;color: #FFFFFF;font-size: 24px;font-weight: 600">
                网站后管理系统
            </div>
            <ul class="nav">
                <li>
                    <a class="text-center">
                        <p><img src="/theme/defaut/images/face-0.jpg" height="80" class="img-circle"></p>
                        <p><%=currentUser%>
                        </p>
                    </a>
                </li>
                <li class="active">
                    <a href="/center/dashboardView.visit.action" target="content">
                        <i class="pe-7s-id"></i>
                        <p>访问统计</p>
                    </a>
                </li>
                <li>
                    <a href="/message/messageView.list.action" target="content">
                        <i class="pe-7s-credit"></i>
                        <p>客户留言</p>
                    </a>
                </li>
                <li>
                    <a href="/news/newsView.list.action" target="content">
                        <i class="pe-7s-note2"></i>
                        <p>新闻管理</p>
                    </a>
                </li>
                <li>
                    <a href="/application/logout.action" target="content">
                        <i class="pe-7s-power"></i>
                        <p>退出</p>
                    </a>
                </li>
                <li class="company-register text-center"> &copy; 2016 MPE</li>
                <li class="company-help-phone text-center">技术支持:QQ4757090</li>
            </ul>
            <ul>

            </ul>
        </div>
    </div>
    <div class="main-panel" style="overflow: hidden">
        <iframe id="content" name="content" frameborder="0" src="/center/dashboardView.visit.action" style="overflow: hidden"></iframe>
    </div>
</div>
</body>
<!--   Core JS Files   -->
<script src="/plugins/lbd/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="/plugins/lbd/js/bootstrap.min.js" type="text/javascript"></script>
<!--  Notifications Plugin    -->
<script src="/plugins/lbd/js/bootstrap-notify.js"></script>
<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="/plugins/lbd/js/light-bootstrap-dashboard.js"></script>
<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script type="text/javascript">

</script>

</html>
