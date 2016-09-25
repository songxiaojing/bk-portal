<%--
  Created by IntelliJ IDEA.
  User: byw-m
  Date: 2016/6/22
  Time: 16:07
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

    <title>开户说明</title>

    <link href="/plugins/gsdk/bootstrap3/css/bootstrap.css" rel="stylesheet"/>
    <link href="/plugins/gsdk/assets/css/get-done.css" rel="stylesheet"/>
    <!--     Font Awesome     -->
    <link href="/plugins/gsdk/bootstrap3/css/font-awesome.css" rel="stylesheet">
    <link href="/plugins/gsdk/assets/css/googleapi-fonts.css" rel='stylesheet' type='text/css'>
    <!-- Custom styles for this template -->
    <link href="/theme/defaut/css/main.css" rel="stylesheet">
    <link href="/theme/defaut/css/open-step.css" rel="stylesheet">
</head>
<body>
<section>
    <div class="container">
        <div class="space-30"></div>
        <div class="row text-center">
            <div class="col-md-12"><img width="70px" src="/theme/defaut/images/logo1-3.png"></div>
        </div>
        <div class="space-30"></div>
        <div class="row">
            <div class="col-md-6 col-lg-offset-1">
                <div>
                    <ul class="list-unstyled steps-intro">
                        <li>
                            <span>1</span>验证手机号，填写个人资料
                        </li>
                        <li>
                            <span>2</span>上传你的身份证和签名
                        </li>
                        <li>
                            <span>3</span>等待资料审核通过
                        </li>
                        <li>
                            <span>4</span>向您的账号存入资金
                        </li>
                        <li>
                            <span>5</span>下载交易软件，开始交易
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3">
                <div class="signup-go text-center">
                    <a class="btn btn-success btn-block" href="/register/user.registerView.action" role="button">在线开户</a>
                    <a href="/accounts?" class="btn btn-regular" data-trace="signup,click,accounts-link" type="button"></a>
                    <p class="tip">已开户？<a href="login">登录</a> 查看开户进度</p>
                    <p>
                    <h4>3分钟创建交易账号</h4>
                    <h4>2个工作日开始交易</h4>
                    <h4>下载交易软件</h4></p>
                </div>
            </div>
        </div>
    </div>
    <div class="space"></div>
</section>
<footer class="footer">
    <div class="container">
        <div class="space-30"></div>
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="credits">
                    &copy; 2016 梧桐证券|京ICP备88888888号|老虎证券客服电话：0571-66666666
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Placed at the end of the document so the pages load faster -->
<script src="/plugins/jquery/jquery.min.js"></script>
<script src="/plugins/gsdk/jquery/jquery-1.10.2.js" type="text/javascript"></script>
<script src="/plugins/gsdk/assets/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>

<script src="/plugins/gsdk/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
<script src="/plugins/gsdk/assets/js/gsdk-checkbox.js"></script>
<script src="/plugins/gsdk/assets/js/gsdk-radio.js"></script>
<script src="/plugins/gsdk/assets/js/gsdk-bootstrapswitch.js"></script>
<script src="/plugins/gsdk/assets/js/get-done.js"></script>
</body>
</html>