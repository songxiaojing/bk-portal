<%--
  Created by IntelliJ IDEA.
  User: byw-m
  Date: 2016/7/5
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <section style="padding-top: 50px">
        <div class="row">
            <div class="col-sm-12 col-md-12 ">
                <div id="visitTotalChart"></div>
            </div>
            <br>
        </div>
    </section>
</div>
<!--   Core JS Files   -->
<script src="/plugins/lbd/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="/plugins/lbd/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/plugins/highcharts/highcharts.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            type: "post",
            url: "/application/visit.visitDaliyChartData.action",
            data: {},
            dataType: "json",
            success: function (data) {
                $('#visitTotalChart').highcharts({
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: '网站访问量日统计图'
                    },
                    subtitle: {
                        text: '范围近30天'
                    },
                    xAxis: {
                        type: 'category',
                        labels: {
                            rotation: -45,
                            style: {
                                fontSize: '13px',
                                fontFamily: 'Verdana, sans-serif'
                            }
                        }
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: '次'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        pointFormat: '当日访问量:{point.y}次'
                    },
                    credits: {
                        enabled: false
                        // 禁用版权信息
                    },
                    series: [{
                        name: '日访问量',
                        data: data,
                        dataLabels: {
                            enabled: true,
                            align: 'center',
                            style: {
                                fontSize: '13px',
                                fontFamily: 'Verdana, sans-serif'
                            }
                        }
                    }]
                });
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("ajax error:" + textStatus);
            }
        });

    });
</script>
</body>
</html>
