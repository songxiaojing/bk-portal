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
                        #5上传资料<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    </li>
                    <li class="step-bar-undone">
                        <div></div>
                        #6完成开户
                    </li>
                </ul>
            </div>
        </div>
    </section>
    <div class="page-header">
        <h3>上传证件
            <small>第五步</small>
        </h3>
    </div>
    <div class="row">
        <div class="col-md-8">
            <section id="companyImportSection">
                <form class="form-horizontal" id="openStepForm" action="/account/openStepD.saveStepCustomerInfo.action" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="identityFrontPicture" class="col-sm-2 control-label">身份证正面:</label>
                        <div class="col-sm-10">
                            <input type="file" id="identityFrontPicture" name="identityFrontPicture">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="identityBackPicture" class="col-sm-2 control-label">身份证反面:</label>
                        <div class="col-sm-10">
                            <input type="file" id="identityBackPicture" name="identityBackPicture">
                        </div>
                    </div>
                    <div class="space-30"></div>
                    <div class="form-group">
                        <div class="col-sm-6 text-center">
                            <div>
                                <img class="img-thumbnail" src="/theme/defaut/images/id_card_1.png">
                            </div>
                            <div>正面</div>
                        </div>
                        <div class="col-sm-6 text-center">
                            <div>
                                <img class="img-thumbnail" src="/theme/defaut/images/id_card_2.png">
                            </div>
                            <div>反面</div>
                        </div>
                    </div>
                    <div class="space-30"></div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-md-7">
                            <button type="button" class="btn btn-success btn-block btn-fill" onclick="submitOpenStepForm(openStepForm)">完成</button>
                        </div>
                    </div>
                </form>
            </section>
        </div>
        <div class="col-md-4">
            <button type="submit" class="btn btn-warning btn-fill btn-block">暂不上传</button>
            <hr>
            <section>
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    为什么需要我的身份证图片？
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <p>证券技术系统采用非对称加密算法来加密存储您的密码。
                                    虽然算法强度复杂，但如果您设置的密码和其他网站的密码相同，您的密码还是有被泄露的风险。 为了安全，请不要在任何情况下在多个网站使用相同的帐号密码组合，否则一旦你在一个网站的帐号密码被泄露，这些信息会威胁到到你在老虎证券的密码安全。</p>

                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    我的身份证图片会被泄露吗？
                                </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                <p>证券技术系统采用非对称加密算法来加密存储您的密码。
                                    虽然算法强度复杂，但如果您设置的密码和其他网站的密码相同，您的密码还是有被泄露的风险。 为了安全，请不要在任何情况下在多个网站使用相同的帐号密码组合，否则一旦你在一个网站的帐号密码被泄露，这些信息会威胁到到你在老虎证券的密码安全。</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
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
<script src="/js/form-validate.js"></script>
<script type="text/javascript">
    //
    function submitOpenStepForm(targetForm) {
        try {
            if (targetForm == null) {
                showAlertMessage("无效的表单");
                return;
            }
            var isSubmit = true;
//
            isSubmit = verifyRequiredElement(document.getElementById("identityFrontPicture"));
            isSubmit = verifyRequiredElement(document.getElementById("identityBackPicture"));
            if (isSubmit == true) {
                targetForm.submit();
            }

        } catch (e) {
            alert(e);
        }

    }

</script>
</body>
</html>
