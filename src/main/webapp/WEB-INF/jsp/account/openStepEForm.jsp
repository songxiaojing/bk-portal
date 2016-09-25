<%--
  Created by IntelliJ IDEA.
  User: byw-m
  Date: 2016/6/2
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <title>第五步 上传证件</title>
    <link href="/plugins/gsdk/bootstrap3/css/bootstrap.css" rel="stylesheet"/>
    <link href="/plugins/gsdk/assets/css/get-done.css" rel="stylesheet"/>

    <!--     Font Awesome     -->
    <link href="/plugins/gsdk/bootstrap3/css/font-awesome.css" rel="stylesheet">
    <link href="/plugins/gsdk/assets/css/googleapi-fonts.css" rel='stylesheet' type='text/css'>
    <!-- form and register step-->
    <link href="/theme/defaut/css/register-step.css" rel='stylesheet' type='text/css'>
    <link href="/theme/defaut/css/main.css" rel='stylesheet' type='text/css'>
    <link href="/theme/defaut/css/form.css" rel='stylesheet' type='text/css'>
    <link href="/theme/defaut/css/open-step.css" rel='stylesheet' type='text/css'>
</head>

<body>
<!-- Begin page content -->
<div class="container">
    <section id="openAccountStepBars">
        <div class="row">
            <div class="col-md-12 text-center">
                <ul class="nav nav-pills step-bar-ul">
                    <li><img src="/theme/defaut/images/logo1-4.png"></li>
                    <li class="step-bar-active">
                        <div></div>
                        #1注册账号<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                    </li>
                    <li class="step-bar-active">
                        <div></div>
                        #2填写资料<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                    </li>
                    <li class="step-bar-active">
                        <div></div>
                        #3投资信息<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                    </li>
                    <li class="step-bar-active">
                        <div></div>
                        #4阅读协议<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                    </li>
                    <li class="step-bar-active">
                        <div></div>
                        #5上传资料<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                    </li>
                    <li class="step-bar-active">
                        <div></div>
                        #6完成开户<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                    </li>
                </ul>
            </div>
        </div>
    </section>
    <div class="space"></div>
    <section>
        <div class="row">
            <div class="col-md-12 text-center">
                <h2>恭喜您，开户申请已成功提交</h2>
                <h4>恭喜您，已成功申请开通梧桐证券交易账户，您可以登录梧桐证券个人中心查看开户进度</h4>
            </div>
        </div>
        <div class="space"></div>
        <div class="row">
            <div class="col-md-12 text-center">
                <a type="submit" class="btn btn-success btn-fill btn-lg" style="width: 200px" href="/center/dashboard.dashboardView.action"><span class="glyphicon glyphicon-hand-right"
                                                                                                                                                  aria-hidden="true"></span> 个人中心</a>
            </div>
        </div>
    </section>
</div>
<footer class="footer">
    <div class="container">
        <div class="space-30"></div>
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="credits">
                    &copy; 2016 梧桐证券|京ICP备88888888号|梧桐证券客服电话：0571-66666666
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/plugins/jquery/jquery.min.js"></script>
<script src="/plugins/gsdk/jquery/jquery-1.10.2.js" type="text/javascript"></script>
<script src="/plugins/gsdk/assets/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>

<script src="/plugins/gsdk/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
<script src="/plugins/gsdk/assets/js/get-done.js"></script>
</body>
</html>
