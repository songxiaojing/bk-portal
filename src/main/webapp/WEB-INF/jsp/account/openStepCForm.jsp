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

    <title>第四步 客户协议</title>
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
                        #4阅读协议<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    </li>
                    <li class="step-bar-undone">
                        <div></div>
                        #5上传资料</span>
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
        <h3>梧桐证券客户协议
            <small>第四步</small>
        </h3>
    </div>
    <div class="row">
        <div class="col-xs-7">
            <section id="companyImportSection">
                <form class="form-horizontal" id="openStepForm" action="/account/openStepC.saveStepCustomerInfo.action" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="lawAuthorize" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>法律承认:</label>
                        <div class="col-sm-7">
                            <label class="radio-inline">
                                <input type="radio" name="lawAuthorize" id="lawAuthorize" value="本人同意">本人同意
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="lawAuthorize" id="lawAuthorize1" value="本人不同意" checked>本人不同意
                            </label>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="transactionsAuthorize" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>账户交易控制及所有权证明:</label>
                        <div class="col-sm-7">
                            <label class="radio-inline">
                                <input type="radio" name="transactionsAuthorize" id="transactionsAuthorize" value="本人同意">本人同意
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="transactionsAuthorize" id="transactionsAuthorize1" value="本人不同意" checked>本人不同意
                            </label>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="depositPublishAuthorize" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>保证金披露:</label>
                        <div class="col-sm-7">
                            <label class="radio-inline">
                                <input type="radio" name="depositPublishAuthorize" id="depositPublishAuthorize" value="本人同意">本人同意
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="depositPublishAuthorize" id="depositPublishAuthorize1" value="本人不同意" checked>本人不同意
                            </label>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="customerAgreementAuthorize" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>客户协议:</label>
                        <div class="col-sm-7">
                            <label class="radio-inline">
                                <input type="radio" name="customerAgreementAuthorize" id="customerAgreementAuthorize" value="本人同意">本人同意
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="customerAgreementAuthorize" id="customerAgreementAuthorize1" value="本人不同意" checked>本人不同意
                            </label>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="w8benTableAuthorize" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>W-8BEN表格:</label>
                        <div class="col-sm-7">
                            <label class="radio-inline">
                                <input type="radio" name="w8benTableAuthorize" id="w8benTableAuthorize" value="本人同意">本人同意
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="w8benTableAuthorize" id="w8benTableAuthorize1" value="本人不同意" checked>本人不同意
                            </label>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="w8benTableSignature" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>W-8BEN电子签名:</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="w8benTableSignature" name="w8benTableSignature" placeholder="请输入W-8BEN电子签名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-7">
                            <div class="checkbox">
                                <label> <input type="checkbox">本人确认上述资料真实有效 &nbsp <span class="requiredInputLabel">*</span>号项为必填内容</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-7">
                            <button type="button" class="btn btn-success btn-block btn-fill" onclick="submitOpenStepForm(openStepForm)">下一步</button>
                        </div>
                    </div>
                </form>
            </section>
        </div>
        <div class="col-xs-5">
            <section>
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h6 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    阅读《法律承认》详细条文
                                </a>
                            </h6>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <p>梧桐证券技术系统采用非对称加密算法来加密存储您的密码。
                                    虽然算法强度复杂，但如果您设置的密码和其他网站的密码相同，您的密码还是有被泄露的风险。 为了安全，请不要在任何情况下在多个网站使用相同的帐号密码组合，否则一旦你在一个网站的帐号密码被泄露，这些信息会威胁到到你在梧桐证券的密码安全。</p>

                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h7 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    阅读《账户交易控制及所有权证明》详细条文
                                </a>
                            </h7>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                <p>梧桐证券技术系统采用非对称加密算法来加密存储您的密码。
                                    虽然算法强度复杂，但如果您设置的密码和其他网站的密码相同，您的密码还是有被泄露的风险。 为了安全，请不要在任何情况下在多个网站使用相同的帐号密码组合，否则一旦你在一个网站的帐号密码被泄露，这些信息会威胁到到你在梧桐证券的密码安全。</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingFour">
                            <h7 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    阅读《保证金披露》详细条文
                                </a>
                            </h7>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                            <div class="panel-body">
                                <p>梧桐证券技术系统采用非对称加密算法来加密存储您的密码。
                                    虽然算法强度复杂，但如果您设置的密码和其他网站的密码相同，您的密码还是有被泄露的风险。 为了安全，请不要在任何情况下在多个网站使用相同的帐号密码组合，否则一旦你在一个网站的帐号密码被泄露，这些信息会威胁到到你在梧桐证券的密码安全。</p>

                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="heading5">
                            <h7 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    阅读《客户协议》详细条文
                                </a>
                            </h7>
                        </div>
                        <div id="collapse5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                            <div class="panel-body">
                                <p>梧桐证券技术系统采用非对称加密算法来加密存储您的密码。
                                    虽然算法强度复杂，但如果您设置的密码和其他网站的密码相同，您的密码还是有被泄露的风险。 为了安全，请不要在任何情况下在多个网站使用相同的帐号密码组合，否则一旦你在一个网站的帐号密码被泄露，这些信息会威胁到到你在梧桐证券的密码安全。</p>

                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="heading6">
                            <h7 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    阅读《W-8BEN表格》详细条文
                                </a>
                            </h7>
                        </div>
                        <div id="collapse6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                            <div class="panel-body">
                                <p>梧桐证券技术系统采用非对称加密算法来加密存储您的密码。
                                    虽然算法强度复杂，但如果您设置的密码和其他网站的密码相同，您的密码还是有被泄露的风险。 为了安全，请不要在任何情况下在多个网站使用相同的帐号密码组合，否则一旦你在一个网站的帐号密码被泄露，这些信息会威胁到到你在梧桐证券的密码安全。</p>

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
            isSubmit = verifyRadioElementTrue(document.getElementById("lawAuthorize"));
            isSubmit = verifyRadioElementTrue(document.getElementById("transactionsAuthorize"));
            isSubmit = verifyRadioElementTrue(document.getElementById("depositPublishAuthorize"));
            isSubmit = verifyRadioElementTrue(document.getElementById("customerAgreementAuthorize"));
            isSubmit = verifyRadioElementTrue(document.getElementById("w8benTableAuthorize"));
            isSubmit = verifyRequiredElement(document.getElementById("w8benTableSignature"));
            if (isSubmit == true) {
                targetForm.submit();
            }

        } catch (e) {
            alert(e);
        }

    }
    function verifyRadioElementTrue(inputElement) {
//
        if ($(inputElement).parent().next().next()) {
            $(inputElement).parent().next().next().html("");
        }
        if ($(inputElement).parent().parent().parent()) {
            $(inputElement).parent().parent().parent().removeClass("has-error");
        }
//is empty or not
        if (inputElement.checked == false) {
            if ($(inputElement).parent().next().next()) {
                $(inputElement).parent().next().next().html("请选择 本人同意");
            }
            if ($(inputElement).parent().parent().parent()) {
                $(inputElement).parent().parent().parent().addClass("has-error");
            }
            return false;
        } else {
            return true;
        }
    }

    function verifyRequiredElement(element) {
//
        clearErrorOnFormElement(element);
//is empty or not
        if (validateRequired(element.value) == false) {
//empty
            showErrorOnFormElement(element, "不能为空");
            return false;
        } else {
            return true;
        }
    }
</script>
</body>
</html>
