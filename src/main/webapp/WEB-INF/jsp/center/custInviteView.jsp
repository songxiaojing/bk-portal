<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bellwin.brokers.modules.center.module.SysUser" %><%--
  Created by IntelliJ IDEA.
  User: byw-m
  Date: 2016/7/5
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%
    SysUser currentSysUser = (SysUser) request.getAttribute("currentUser");
    int myInviteCount = (int) request.getAttribute("myInviteCount");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/favicon.ico">

    <title>梧桐证券-个人中心-我的邀请</title>

    <!-- Bootstrap core CSS     -->
    <link href="/plugins/lbd/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Animation library for notifications   -->
    <link href="/plugins/lbd/css/animate.min.css" rel="stylesheet"/>
    <!--  Light Bootstrap Table core CSS    -->
    <link href="/plugins/lbd/css/light-bootstrap-dashboard.css" rel="stylesheet"/>
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="/plugins/lbd/css/content.css" rel="stylesheet"/>
    <!--     Fonts and icons     -->
    <link href="/plugins/lbd/css/pe-icon-7-stroke.css" rel="stylesheet"/>
    <style rel="stylesheet">
        .myInvate {
            padding: 30px 10px 20px 10px;
            height: 150px;
            background-image: url(/theme/defaut/images/invate_bg.png);
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <section>
        <div class="row">
            <div class="col-md-12 col-sm-12  ">
                <div class="card">
                    <div class="header">我的邀请</div>
                    <hr>
                    <div class="content">
                        <div class="row">
                            <div class="col-xs-5 col-md-5 col-xs-offset-1 text-center myInvate">
                                <ul class="list-unstyled">
                                    <li><h5>我的专属邀请链接</h5></li>
                                    <li>邀请码:<%=currentSysUser.getMyInvitationCode()%>
                                    </li>
                                    <li><a>https://a.xxx.net/accounts?invite=<%=currentSysUser.getMyInvitationCode()%>
                                    </a></li>
                                </ul>
                            </div>
                            <div class="col-xs-3 col-md-3 text-left">
                                <ul class="list-unstyled text-center">
                                    <li><h2><%=myInviteCount%>
                                    </h2></li>
                                    <li>您已邀请好友<%=myInviteCount%>个</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<!--   Core JS Files   -->
<script src="/plugins/lbd/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="/plugins/lbd/js/bootstrap.min.js" type="text/javascript"></script>
<!--  Notifications Plugin    -->
<script type="text/javascript">
</script>
</body>
</html>