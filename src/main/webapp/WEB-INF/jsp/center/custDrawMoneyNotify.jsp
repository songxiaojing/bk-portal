<%--
  Created by IntelliJ IDEA.
  User: byw-m
  Date: 2016/7/4
  Time: 16:57
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

    <title>梧桐证券-个人中心-存入资金</title>

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
    <!-- form and register step-->
    <link href="/theme/defaut/css/main.css" rel='stylesheet' type='text/css'>
    <link href="/theme/defaut/css/form.css" rel='stylesheet' type='text/css'>
</head>

<body>
<!-- Begin page content -->
<div class="container">
    <section>
        <div class="row">
            <div class="col-sm-12 col-md-12 ">
                <div class="card">
                    <div class="header">提示资金</div>
                    <hr>
                    <div class="content">
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <form class="form-horizontal" id="dataForm" action="/center/custDrawMoneyNotify.saveDrawMoneyNotify.action" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="currencyType" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>提取币种:</label>
                                        <div class="col-sm-7">
                                            <label class="radio-inline">
                                                <input type="radio" name="currencyType" id="currencyType" value="美元" checked>美元
                                            </label>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bankType" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>收款银行:</label>
                                        <div class="col-sm-7">
                                            <label class="radio-inline">
                                                <input type="radio" name="bankType" id="bankType" value="大陆银行" checked>大陆银行
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="bankType" id="bankType1" value="香港银行">香港银行
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="bankType" id="bankType2" value="境外银行">境外银行
                                            </label>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bankName" class="col-sm-3 control-label">收款银行名称:</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" id="bankName" name="bankName" placeholder="请输入收款银行名称">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bankAccount" class="col-sm-3 control-label">收款银行账号:</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" id="bankAccount" name="bankAccount" placeholder="请输入收款银行账号">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="swiftCode" class="col-sm-3 control-label">SWIFT Code:</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" id="swiftCode" name="swiftCode" placeholder="请输入SWIFT Code">
                                            <span class="help-block"></span>
                                            <span>请向您的收款银行客服咨询</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bankAccountName" class="col-sm-3 control-label">收款账户名:</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" id="bankAccountName" name="bankAccountName" placeholder="邀请码（没有可以不填写）">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="amount" class="col-sm-3 control-label">提取金额:</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" id="amount" name="amount" placeholder="输入提取金额">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="comment" class="col-sm-3 control-label">留言备注:</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" id="comment" name="comment" placeholder="输入留言备注">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"></label>
                                        <div class="col-sm-7">
                                            使用和证券账户同名的银行账户汇款后请务必填写此表格，方便您资金顺利到账；不填写此表格，或填写金额与实际入金金额相差过大会造成资金到账时间变长
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-7">
                                            <button type="button" class="btn btn-success btn-block btn-fill" onclick="submitOpenStepForm(dataForm)">通知梧桐处理款项</button>
                                        </div>
                                    </div>
                                </form>
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
<script src="/js/form-validate.js"></script>
<script type="text/javascript">
    function submitOpenStepForm(targetForm) {
        try {
            if (targetForm == null) {
                showAlertMessage("无效的表单");
                return;
            }
            var isSubmit = true;
//
            isSubmit = verifyRequiredElement(document.getElementById("bankType"));
            isSubmit = verifyRequiredElement(document.getElementById("bankName"));
            isSubmit = verifyRequiredElement(document.getElementById("bankAccount"));
            isSubmit = verifyRequiredElement(document.getElementById("bankAccountName"));
            isSubmit = verifyRequiredElement(document.getElementById("amount"));
            //
            if (validateInteger(document.getElementById("amount").value) == false) {
                isSubmit = false;
                clearErrorOnFormElement(document.getElementById("amount"));
                showErrorOnFormElement(document.getElementById("amount"), "请输入正确的金额");
            }
            //
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