<%@ page import="com.bellwin.brokers.modules.center.module.SysUser" %>
<%@ page import="com.bellwin.brokers.modules.center.module.CustInfo" %>
<%@ page import="com.bellwin.brokers.modules.center.module.CustStockAccount" %><%--
  Created by IntelliJ IDEA.
  User: byw-m
  Date: 2016/7/5
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    SysUser currentSysUser = (SysUser) request.getAttribute("currentUser");
    CustInfo currentCustmoer = (CustInfo) request.getAttribute("currentCustomer");
    CustStockAccount stockAccount = (CustStockAccount) request.getAttribute("stockAccount");
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

    <title>梧桐证券-个人中心-我的账户</title>

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
</head>

<body>
<!-- Begin page content -->
<div class="container">
    <section>
        <div class="row">
            <div class="col-sm-12 col-md-12 ">
                <div class="card">
                    <div class="header"><h4 class="title">我的账户</h4></div>
                    <hr>
                    <div class="content">
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <dl class="dl-horizontal customer-info-list">
                                    <dt>姓名:</dt>
                                    <dd><%=currentCustmoer.getName()%>
                                    </dd>
                                    <dt>手机号:</dt>
                                    <dd><%=currentSysUser.getMobile()%>
                                    </dd>
                                    <dt>邮箱:</dt>
                                    <dd><%=currentCustmoer.getEmail()%>
                                    </dd>
                                    <dt>邀请码:</dt>
                                    <dd><%=currentSysUser.getMyInvitationCode()%>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="row">
            <div class="col-sm-12 col-md-12 ">
                <div class="card">
                    <div class="header"><h4 class="title">交易账户</h4></div>
                    <hr>
                    <div class="content">
                        <%if (stockAccount != null) {%>
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <dl class="dl-horizontal customer-info-list">
                                    <dt>账号:</dt>
                                    <dd><%=stockAccount.getStockAccount()%>
                                    </dd>
                                    <dt>账户状态:</dt>
                                    <dd><%=stockAccount.getStatus()%>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <%} else {%>
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <dl class="dl-horizontal customer-info-list">
                                    <dt>账号正在开通中......</dt>
                                    <dd></dd>
                                </dl>
                            </div>
                        </div>
                        <%}%>
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
<script src="/plugins/lbd/js/bootstrap-notify.js"></script>
<script type="text/javascript">
    $(document).ready(function () {


    });
</script>
</body>
</html>
