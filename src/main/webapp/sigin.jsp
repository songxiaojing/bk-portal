<%--
  Created by IntelliJ IDEA.
  User: byw-m
  Date: 2016/6/6
  Time: 13:08
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
    <link rel="icon" href="favicon.ico">

    <title>网站后台管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="/plugins/bootstrap/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/theme/defaut/css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]>
    <script src="plugins/bootstrap/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/plugins/bootstrap/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="/plugins/bootstrap/assets/js/html5shiv.min.js"></script>
    <script src="/plugins/bootstrap/assets/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div class="container">

    <form class="form-signin" id="siginForm" action="/application/login.action" method="post" enctype="multipart/form-data">
        <h2 class="form-signin-heading">请登录</h2>
        <label for="mobile" class="sr-only">请输入手机号</label>
        <input type="text" id="mobile" name="mobile" class="form-control" placeholder="请输入手机号" required autofocus>
        <label for="password" class="sr-only">密码</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="密码" required>

        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>

    </form>
</div> <!-- /container -->


<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="/plugins/bootstrap/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
