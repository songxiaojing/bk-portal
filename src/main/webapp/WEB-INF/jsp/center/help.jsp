<%--
  Created by IntelliJ IDEA.
  User: byw-m
  Date: 2016/7/5
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mpe.portal.web.utils.WebText" %>
<%
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

    <title><%=WebText.WEB_TITLE%></title>

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
        <div class="page-header">
            <h4>当前用户密码修改</h4>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-12 ">
                <div class="well">
                    <p>请联系管理员帮您重新设置密码</p>
                    <p>联系方式：QQ:4757090,邮箱：4757090@qq.com</p>
                    <p>请在联系时提供您的旧密码与新密码</p>
                </div>
            </div>
        </div>
        <div class="page-header">
            <h4>系统BUG报送与解决</h4>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-12 ">
                <div class="well">
                    <p>请联系管理员，并提供相关bug的页面的地址与截图</p>
                    <p>联系方式：QQ:4757090,邮箱：4757090@qq.com</p>
                </div>
            </div>
        </div>
        <div class="page-header">
            <h4>系统JAVA运行环境</h4>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-12 ">
                <div class="well">
                    <p>系统当前版本:${applicationVersion}</p>
                    <p>JDK路径:${jdkPath}</p>
                    <p>JDK版本:${jdkVesrion}</p>
                    <p>TOMCAT路径:${tomcatPath}</p>
                    <p>JVM内存总量:${totalMem}</p>
                    <p>JVM空闲内存量:${freeMen}</p>
                    <p>JVM最大内可使用存量:${maxMen}</p>
                </div>
            </div>
        </div>
    </section>
</div>
<br>
</div>
</section>
</div>
</body>
</html>
