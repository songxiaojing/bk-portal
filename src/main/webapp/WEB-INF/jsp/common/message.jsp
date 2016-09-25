<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

	<title>梧桐证券-个人中心-消息</title>

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
					<div class="header"><h4 class="title">操作结果</h4></div>
					<hr>
					<div class="content">
						<div class="row">
							<div class="col-sm-12 col-md-12 text-center">
								<%
									out.println(request.getAttribute("forward_message"));
								%>
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
<script src="/plugins/lbd/js/bootstrap-notify.js"></script>
<script type="text/javascript">
	$(document).ready(function () {


	});
</script>
</body>
</html>