<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mpe.portal.web.resources.modules.ResNews" %>
<%@ page import="com.mpe.portal.web.utils.Assert" %>
<%@ page import="com.mpe.portal.web.utils.NewsUtil" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    int shortBodyLen = 200;
    int shortTitleLen = 20;
    //int pageSize = (int) request.getAttribute("pageSize");
    int pageNumber = (int) request.getAttribute("pageNumber");
    int newsCounter = (int) request.getAttribute("newsCounter");
    int paginationRange = (int) request.getAttribute("paginationRange");
    List<ResNews> pageNewsList = (List<ResNews>) request.getAttribute("pageNewsList");


%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>河北迈普润光学物流运营有限公司-消息新闻</title>
    <link rel="icon" href="../fav.png">
    <link href="../plugins/gsdk/bootstrap3/css/bootstrap.css" rel="stylesheet"/>
    <link href="../plugins/gsdk/assets/css/get-done.css" rel="stylesheet"/>

    <!--     Font Awesome     -->
    <link href="../plugins/gsdk/bootstrap3/css/font-awesome.css" rel="stylesheet">
    <link href='../plugins/gsdk/assets/css/googleapi-fonts.css' rel='stylesheet' type='text/css'>

    <!-- css framework -->
    <link href="../theme/defaut/css/topMenu.css" rel="stylesheet" type="text/css">
    <link href="../theme/defaut/css/foot.css" rel="stylesheet" type="text/css">
    <link href="../theme/defaut/css/main.css" rel="stylesheet" type="text/css">
    <!--  self css-->
    <link href="news.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="navbar-full">
    <div id="navbar">
        <!--
            navbar-default can be changed with navbar-ct-blue navbar-ct-azzure navbar-ct-red navbar-ct-green navbar-ct-orange
            -->
        <nav class="navbar navbar-ct-blue navbar-transparent navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <span class="banner-title"><img src="../logo.png">迈普润光学物流</span>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <ul class="nav navbar-nav">
                            <li><a href="/index.html">网站首页</a></li>
                            <li><a href="/about/about.html">关于我们</a></li>
                            <li class="active"><a href="/news/newsView.news.action">新闻中心</a></li>
                            <li><a href="/production/production.html">产品展示</a></li>
                            <li><a href="/service/service.html">服务支持</a></li>
                            <li><a href="/hr/hr.html">人力资源</a></li>
                            <li><a href="/contact/contact.html">联系我们</a></li>
                        </ul>
                    </ul>

                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div><!--  end navbar -->
</div> <!-- end menu-dropdown -->
<div class="main">
    <section class="">
        <div class="container">
            <div class="space"></div>
            <div class="row">
                <div class="col-md-12 text-left">
                    <div class="panel panel-default">
                        <table class="table">
                            <%
                                if (pageNewsList != null && !pageNewsList.isEmpty()) {
                                    for (ResNews rawNews : pageNewsList) {
                            %>
                            <tr>
                                <td>
                                    <div class="media">
                                        <a class="pull-left" href="/news/newsView.detail.action?id=<%=rawNews.getId()%>" target="<%=rawNews.getId()%>">
                                            <%if (Assert.isEmptyString(rawNews.getType())) {%>
                                            <img data-src="holder.js/120x120/auto" alt="无图片"
                                                 src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEzLjQ2MDkzNzUiIHk9IjMyIiBzdHlsZT0iZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQ7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9nPjwvc3ZnPg=="
                                                 data-holder-rendered="true" style="width: 120px; height: 120px;"
                                                 class="featurette-image img-responsive img-thumbnail">
                                            <%} else {%>
                                            <img src="/news/newsView.showImage.action?id=<%=rawNews.getId()%>"
                                                 data-holder-rendered="true" style="width: 120px; height: 120px;"
                                                 class="featurette-image img-responsive img-thumbnail" alt="<%=rawNews.getType()%>">
                                            <%}%>
                                        </a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><a href="/news/newsView.detail.action?id=<%=rawNews.getId()%>"
                                                                         target="<%=rawNews.getId()%>"><%=NewsUtil.getShortText(rawNews.getNewTitle(), shortTitleLen)%>
                                            </a>
                                            </h4>
                                            <h6>发布时间：<%=simpleDateFormat.format(rawNews.getPublishAt())%>
                                            </h6>
                                            <%=NewsUtil.getShortText(rawNews.getNewBody(), shortBodyLen)%>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                            <!--
                            <tr>
                                <td>
                                    <div class="media">
                                        <a class="pull-left" href="#">
                                            <img data-src="holder.js/120x120/auto" alt="64x64"
                                                 src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEzLjQ2MDkzNzUiIHk9IjMyIiBzdHlsZT0iZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQ7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9nPjwvc3ZnPg=="
                                                 data-holder-rendered="true" style="width: 120px; height: 120px;"
                                                 class="featurette-image img-responsive img-thumbnail">
                                        </a>
                                        <div class="media-body">
                                            <h4 class="media-heading">Deprecated pull-right pull-left example</h4>
                                            <h6>2016-10-1</h6>
                                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio,
                                            vestibulum in vulputate at, tempus viverra turpis.
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="media">
                                        <a class="pull-left" href="#">
                                            <img data-src="holder.js/120x120/auto" alt="64x64"
                                                 src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEzLjQ2MDkzNzUiIHk9IjMyIiBzdHlsZT0iZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQ7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9nPjwvc3ZnPg=="
                                                 data-holder-rendered="true" style="width: 120px; height: 120px;"
                                                 class="featurette-image img-responsive img-thumbnail">
                                        </a>
                                        <div class="media-body">
                                            <h4 class="media-heading">Deprecated pull-right pull-left example</h4>
                                            <h6>2016-10-1</h6>
                                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio,
                                            vestibulum in vulputate at, tempus viverra turpis.
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="media">
                                        <a class="pull-left" href="#">
                                            <img data-src="holder.js/120x120/auto" alt="64x64"
                                                 src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEzLjQ2MDkzNzUiIHk9IjMyIiBzdHlsZT0iZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQ7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9nPjwvc3ZnPg=="
                                                 data-holder-rendered="true" style="width: 120px; height: 120px;"
                                                 class="featurette-image img-responsive img-thumbnail">
                                        </a>
                                        <div class="media-body">
                                            <h4 class="media-heading">Deprecated pull-right pull-left example</h4>
                                            <h6>2016-10-1</h6>
                                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio,
                                            vestibulum in vulputate at, tempus viverra turpis.
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="media">
                                        <a class="pull-left" href="#">
                                            <img data-src="holder.js/120x120/auto" alt="64x64"
                                                 src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEzLjQ2MDkzNzUiIHk9IjMyIiBzdHlsZT0iZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQ7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9nPjwvc3ZnPg=="
                                                 data-holder-rendered="true" style="width: 120px; height: 120px;" featurette-image img-responsive img-thumbnail>
                                        </a>
                                        <div class="media-body">
                                            <h4 class="media-heading">Deprecated pull-right pull-left example</h4>
                                            <h6>2016-10-1</h6>
                                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio,
                                            vestibulum in vulputate at, tempus viverra turpis.
                                        </div>
                                    </div>
                                </td>
                            </tr>-->
                        </table>
                    </div>
                    <%if (newsCounter > 0) {%>
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li>
                                <a href="/news/newsView.news.action?pageNumber=<%=pageNumber-1%>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <%for (int i = 0; i < paginationRange; i++) {%>
                            <li class="<%=i==pageNumber?"active":""%>"><a href="/news/newsView.news.action?pageNumber=<%=i+1%>"><%=i + 1%>
                            </a></li>
                            <%}%>
                            <li>
                                <a href="/news/newsView.news.action?pageNumber=<%=pageNumber+1%>" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <%}%>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- end main -->
<div class="parallax-pro">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <ul class="list-inline footer-a">
                    <li><h4><a href="/about/about.html">关于我们</a></h4></li>
                    <li><h4><a href="/hr/hr.html">加入我们</a></h4></li>
                    <li><img class="img-rounded" src="../logo.png" height="50px"></li>
                    <li><h4><a href="/contact/contact.html">联系我们</a></h4></li>
                    <li><h4><a href="/contact/contact.html">商务合作</a></h4></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">
                <ul class="list-unstyled">
                    <li>河北迈普润光学物流运营有限公司</li>
                    <li>联系电话：0311-85111508</li>
                    <li>传真：0311-85111588</li>
                    <li>电子邮件：market@mpe.com.cn</li>
                    <li>联系地址：河北省石家庄市裕华区万达广场写字楼A座5层</li>
                    <li>&copy; 2016 迈普润 <i class="fa fa-heart heart" alt="love"></i> 京ICP备88888888号</li>
                </ul>
            </div>
        </div>
        <div class="space-30"></div>
    </div>
</div>

<script src="../plugins/gsdk/jquery/jquery-1.10.2.js" type="text/javascript"></script>
<script src="../plugins/gsdk/assets/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
<script src="../plugins/gsdk/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
<script src="../plugins/gsdk/assets/js/get-done.js"></script>
<script src="../plugins/gsdk/assets/js/custom.js"></script>
<script src="../plugins/bootstrap/assets/js/vendor/holder.min.js"></script>
<script type="text/javascript">
</script>
</body>
</html>