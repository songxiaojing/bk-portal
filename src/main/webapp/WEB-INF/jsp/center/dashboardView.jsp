<%@ page import="com.bellwin.brokers.modules.center.module.CustInfo" %><%--
  Created by IntelliJ IDEA.
  User: byw-m
  Date: 2016/6/2
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustInfo currentCustInfo = (CustInfo) request.getAttribute("currentCustomer");
    String portalHome = (String) request.getAttribute("portalHome");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="icon" type="image/png" href="/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

    <title>梧桐证券-个人中心</title>

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
    <div class="sidebar" data-color="buttonwood" data-image="/theme/defaut/images/sidebar-5.jpg">
        <!--

            Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
            Tip 2: you can also add an image using data-image tag

        -->

        <div class="sidebar-wrapper">
            <div class="logo text-center">
                <img src="/logo.png" height="40">
            </div>
            <ul class="nav">
                <li>
                    <a class="text-center">
                        <p><img src="/theme/defaut/images/face-0.jpg" height="80" class="img-circle"></p>
                        <p><%=currentCustInfo.getName()%>
                        </p>
                    </a>
                </li>
                <li class="active">
                    <a href="/center/custAccount.custAccountView.action" target="content">
                        <i class="pe-7s-id"></i>
                        <p>我的账户</p>
                    </a>
                </li>
                <li>
                    <a href="/center/custRemittanceNotify.custRemittanceNotifyView.action" target="content">
                        <i class="pe-7s-credit"></i>
                        <p>存入资金</p>
                    </a>
                </li>
                <li>
                    <a href="/center/custDrawMoneyNotify.custDrawMoneyNotifyView.action" target="content">
                        <i class="pe-7s-note2"></i>
                        <p>提取资金</p>
                    </a>
                </li>
                <li>
                    <a href="/center/custInvite.custInviteView.action" target="content">
                        <i class="pe-7s-share"></i>
                        <p>我的邀请</p>
                    </a>
                </li>
                <li>
                    <a href="/center/custActivity.html" target="content">
                        <i class="pe-7s-gift"></i>
                        <p>我的活动</p>
                    </a>
                </li>
                <li>
                    <a href="/center/custNotification.html" target="content">
                        <i class="pe-7s-bell"></i>
                        <p>公告消息</p>
                    </a>
                </li>
                <li class="company-help">
                    <a href="/center/custHelp.html" target="content">
                        <i class="pe-7s-headphones"></i>
                        <p>需要帮助</p>
                    </a>
                </li>
                <li class="company-register text-center"> &copy; 2016 梧桐证券|京ICP备88888888号</li>
                <li class="company-help-phone text-center">客服电话：0571-66666666</li>
            </ul>
            <ul>

            </ul>
        </div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">个人中心</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li class="active"><a href="/index.html">首页</a></li>
                        <li><a href="<%=portalHome%>/guide/guide.html">美股学堂</a></li>
                        <li><a href="<%=portalHome%>/download/download.html">下载</a></li>
                        <li><a href="<%=portalHome%>/help/help.html">帮助</a></li>
                        <li><a href="<%=portalHome%>/about/about.html">关于</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="pe-7s-mail"></i>消息
                                <b class="caret"></b>
                                <span class="notification">5</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">最新发布的公告 1</a></li>
                                <li><a href="#">最新发布的公告 2</a></li>
                                <li><a href="#">最新发布的公告 3</a></li>
                                <li><a href="#">最新发布的公告 4</a></li>
                                <li class="divider"></li>
                                <li><a href="#">更多....</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="pe-7s-settings"></i>个人设置
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">设置密码</a></li>
                                <li><a href="#">设置邮箱</a></li>
                                <li class="divider"></li>
                                <li><a href="#">修改手机号</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/application/logout.action">
                                <i class="pe-7s-power"></i>
                                登出
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <iframe id="content" name="content" frameborder="0" src="/center/custAccount.custAccountView.action"></iframe>
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
